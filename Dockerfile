FROM python:3-stretch

RUN sed -i -e 's|http://deb.debian.org/|http://debian-mirror.sakura.ne.jp/|' /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get install -y \
        build-essential \
        libturbojpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        tzdata \
        gosu \
        plantuml \
        graphviz \
    && pip install \
        sphinx \
        sphinx-autobuild \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
        sphinxcontrib-plantuml \
    && mkdir /fonts \
    && wget -O /fonts/NotoSansCJKjp-Regular.ttf https://github.com/hnakamur/Noto-Sans-CJK-JP/raw/master/fonts/NotoSansCJKjp-Regular.ttf \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apt-get remove --autoremove -y \
        build-essential \
        libturbojpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        tzdata \
    && mkdir -p /usr/share/zoneinfo/Asia \
    && ln /etc/localtime /usr/share/zoneinfo/Asia/Tokyo \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN pip install solar-theme
COPY files files
COPY my-sphinx-quickstart /usr/local/bin/

RUN mkdir documents
WORKDIR /documents
VOLUME /documents

CMD ["sh"]

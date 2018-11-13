FROM python:3-stretch

RUN sed -i -e 's|http://deb.debian.org/|http://debian-mirror.sakura.ne.jp/|' /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get install -y \
        build-essential \
        libturbojpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
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
        solar-theme \
    && cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apt-get remove -y --autoremove \
        build-essential \
        libturbojpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

COPY files files
COPY my-sphinx-quickstart /usr/local/bin/

RUN mkdir documents
WORKDIR /documents
VOLUME /documents

CMD ["sh"]

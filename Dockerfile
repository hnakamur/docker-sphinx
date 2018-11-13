FROM python:3-stretch AS builder

RUN sed -i -e 's|http://deb.debian.org/|http://debian-mirror.sakura.ne.jp/|' /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get install -y \
        build-essential \
        libturbojpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
    && pip install \
        sphinx \
        sphinx-autobuild \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
        sphinxcontrib-plantuml \
        solar-theme


FROM python:3-stretch

COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /usr/local/lib/ /usr/local/lib/

RUN sed -i -e 's|http://deb.debian.org/|http://debian-mirror.sakura.ne.jp/|' /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get install -y \
        gosu \
        plantuml \
        graphviz \
    && cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
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

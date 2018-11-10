FROM python:3-alpine

RUN apk add --update --no-cache \
        make \
        build-base \
        zlib-dev \
        libjpeg-turbo-dev \
        freetype \
        freetype-dev \
    && pip install \
        sphinx \
        sphinx_rtd_theme \
        sphinx-autobuild \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
    && mkdir /fonts \
    && wget -O /fonts/NotoSansCJKjp-Regular.ttf https://github.com/hnakamur/Noto-Sans-CJK-JP/raw/master/fonts/NotoSansCJKjp-Regular.ttf \
    && apk del build-base

COPY files files
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

RUN mkdir documents
WORKDIR /documents
VOLUME /documents

CMD ["make", "html"]

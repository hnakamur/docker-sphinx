FROM alpine:3.6 AS builder

RUN apk add --update --no-cache \
        python3 \
        python3-dev \
        make \
        build-base \
        git \
        zlib-dev \
        libjpeg-turbo-dev \
        freetype-dev \
        tzdata \
    && pip3 install \
        sphinx==2.0 \
        sphinx-autobuild \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
        sphinxcontrib-plantuml \
        sphinx-copybutton \
        git+https://github.com/draftcode/japanese-text-join \
        solar-theme

FROM alpine:3.6

ENV PLANTUML_VERSION 1.2019.4

COPY --from=builder /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY --from=builder /usr/bin/sphinx-* /usr/bin/
COPY --from=builder /usr/lib/python3.6/site-packages/ /usr/lib/python3.6/site-packages/ 

# Installation of PlantUML and OpenJDK are based on the following Dockerfiles.
# PlantUML
# https://github.com/miy4/docker-plantuml/blob/7f4d1fabd2cd71da6201a41c2aca5e2ed3807a29/Dockerfile
# OpenJDK
# https://github.com/docker-library/openjdk/blob/47a6539cd18023dafb45db9013455136cc0bca07/8/jdk/alpine/Dockerfile
# http://dl-cdn.alpinelinux.org/alpine/edge/testing/ repository is needed for installing gosu.

RUN apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        python3 \
        make \
        gosu \
        zlib \
        libjpeg-turbo \
        freetype \
        'graphviz<2.39' \
        ttf-droid \
        ttf-droid-nonlatin \
        openjdk8-jre \
        curl \
    && mkdir /app \
    && curl -sSL -o /app/plantuml.jar https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download \
    && mkdir /fonts \
    && curl -sSL -o /fonts/NotoSansCJKjp-Regular.ttf https://github.com/hnakamur/Noto-Sans-CJK-JP/raw/master/fonts/NotoSansCJKjp-Regular.ttf \
    && mkdir -p /usr/share/zoneinfo/Asia \
    && ln /etc/localtime /usr/share/zoneinfo/Asia/Tokyo

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

COPY files files
COPY my-sphinx-quickstart /usr/local/bin/

RUN mkdir documents
WORKDIR /documents
VOLUME /documents

CMD ["make", "html"]

FROM python:3-alpine AS builder

RUN apk add --update --no-cache \
        make \
        build-base \
        git \
        zlib-dev \
        libjpeg-turbo-dev \
        freetype-dev \
        tzdata \
    && pip install \
        sphinx \
        sphinx-autobuild \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
        sphinxcontrib-plantuml \
        solar-theme

FROM python:3-alpine

ENV PLANTUML_VERSION 1.2018.5

COPY --from=builder /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /usr/local/lib/ /usr/local/lib/

# Installation of PlantUML and OpenJDK are based on the following Dockerfiles.
# PlantUML
# https://github.com/miy4/docker-plantuml/blob/7f4d1fabd2cd71da6201a41c2aca5e2ed3807a29/Dockerfile
# OpenJDK
# https://github.com/docker-library/openjdk/blob/47a6539cd18023dafb45db9013455136cc0bca07/8/jdk/alpine/Dockerfile

RUN apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        make \
        gosu \
        zlib \
        libjpeg-turbo \
        freetype \
        graphviz \
        ttf-droid \
        ttf-droid-nonlatin \
        openjdk8-jre \
    && mkdir /app \
    && wget -O /app/plantuml.jar https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download \
    && mkdir /fonts \
    && wget -O /fonts/NotoSansCJKjp-Regular.ttf https://github.com/hnakamur/Noto-Sans-CJK-JP/raw/master/fonts/NotoSansCJKjp-Regular.ttf \
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

CMD ["sh"]

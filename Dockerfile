FROM alpine:3.13

LABEL author="new5tt"
LABEL description="alpinelinux from npm"
LABEL maintainer="chn_614si@163.com"

ENV CONFIG_DIR="${BASE_DIR}/config"\
    BASE_PACKAGE="tzdata nodejs npm python2 python2-dev make autoconf"

RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories &&\
    apk update && apk upgrade && apk add ${BASE_PACKAGE} &&\
    npm config set registry https://repo.huaweicloud.com/repository/npm/ &&\
    npm cache clean -f &&\
    npm config set disturl https://repo.huaweicloud.com/nodejs &&\
    npm config set sass_binary_site https://repo.huaweicloud.com/node-sass &&\
    npm config set python_mirror https://repo.huaweicloud.com/python &&\
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo 'Asia/Shanghai' > /etc/timezone &&\
    apk del tzdata &&\
    rm -rf /var/cache/apk/*

CMD ["sh"]
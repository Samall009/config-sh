#!/usr/bin/sh
/bin/sh -c set -ex
# 换源
sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories
# 更新包管理器
apk update
# 安装PHP以及扩展
apk add --no-cache ca-certificates curl wget tar xz libressl tzdata pcre php7 
apk add --no-cache php7-bcmath php7-curl php7-ctype php7-dom php7-fileinfo php7-gd
apk add --no-cache php7-iconv php7-json php7-mbstring php7-mysqlnd php7-openssl
apk add --no-cache php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-phar php7-posix
apk add --no-cache php7-redis php7-simplexml php7-sockets php7-sodium php7-sysvshm
apk add --no-cache php7-sysvmsg php7-sysvsem php7-tokenizer php7-zip php7-zlib php7-xml
apk add --no-cache php7-xmlreader php7-xmlwriter php7-pcntl
# 删除dev
apk del --purge *-dev
# 删除缓存文件
rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php7
# 输出显示信息
php -v && php -m && echo -e "\033[42;37m Build Completed :).\033[0m\n"
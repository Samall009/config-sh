#!/usr/bin/sh
# update apk
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# 更新索引
apk update
# 安装依赖
apk add --no-cache gcc g++ linux-headers make m4 autoconf
# 执行安装
apk add --no-cache php7 php7-dev php7-common php7-pear
# 安装扩展
apk add --no-cache php7-common php7-bz2 php7-mysqli php7-iconv
apk add --no-cache php7-gmp php7-intl php7-openssl php7-pecl-imagickapk
apk add --no-cache php7-xsl php7-pecl-imagick php7-snmp
apk add --no-cache php7-pecl-redis php7-pecl-uuid php7-enchant php7-snmp
apk add --no-cache php7-pecl-amqp php7-exif php7-recode php7-gd php7-json
apk add --no-cache php7-imap php7-zip php7-pecl-mcrypt php7-bcmath php7-sockets
apk add --no-cache php7-pecl-event php7-pecl-memcached php7-pdo php7-mysqli php7-simplexml
# 更新pecl源
pecl channel-update pecl.php.net
# 安装
apk add imagemagick
# 安装swoole
pecl install swoole
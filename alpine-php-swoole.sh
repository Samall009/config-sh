#!/usr/bin/sh
set -ex
# 换源
sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories
# 更新包管理器
apk update
# 安装依赖软件
apk add --no-cache libstdc++ openssl git bash
apk add --no-cache --virtual .build-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make php7-dev php7-pear pkgconf re2c pcre-dev pcre2-dev zlib-dev libtool automake libaio-dev openssl-dev
# 开始安装swoole
cd /tmp
# 下载swoole安装包
curl -SL "https://github.com/swoole/swoole-src/archive/v4.4.1.tar.gz" -o swoole.tar.gz
# 解包
mkdir -p swoole
tar -xf swoole.tar.gz -C swoole --strip-components=1
# 链接PHP工具
ln -s /usr/bin/phpize7 /usr/local/bin/phpize
ln -s /usr/bin/php-config7 /usr/local/bin/php-config
# 开始配置安装
cd swoole
phpize 
./configure --enable-mysqlnd --enable-openssl
make -s -j$(nproc) && make install
# 添加配置文件
echo "extension=swoole.so" > /etc/php7/conf.d/swoole.ini
# echo "swoole.use_shortname = 'Off'" >> /etc/php7/conf.d/swoole.ini
php -v
php -m
php --ri swoole
# 清理文件
apk del .build-deps
rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php*
echo -e "\033[42;37m Successfully :).\033[0m\n"
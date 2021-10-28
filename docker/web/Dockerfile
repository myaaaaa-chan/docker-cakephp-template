FROM centos:centos7.9.2009

# OSアップデート
RUN yum -y update

# devグループ、devpowerユーザ作成
RUN groupadd dev
RUN useradd -g dev devpower

# 作業ディレクトリ作成
RUN mkdir -p /export/www/docker-template-web
RUN chown -R devpower:dev /export
RUN chmod -R 775 /export

# PHP,php-fpmインストール
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y --enablerepo=remi,remi-php74 php74 php74-php-devel php-fpm php-gd php-pear php-pgsql php-intl php-mbstring php-xml php-math php-pdo php-pecl-memcached

# 各種ライブラリインストール
RUN yum install -y vim
RUN yum install -y unzip

RUN mkdir -p /var/run/php-fpm
RUN echo "d /run/php-fpm   750 nginx dev" > /usr/lib/tmpfiles.d/php-fpm.conf

# nginxインストール
RUN useradd --shell /sbin/nologin -g dev nginx
RUN /bin/sh -c 'yum install -y nginx'

# nginxログディレクトリ
RUN mkdir -p /var/log/nginx/docker-template-web/web
RUN mkdir -p /var/log/nginx/docker-template-web/api
RUN mkdir -p /var/log/nginx/docker-template-web/admin
RUN chown -R nginx:dev /var/log/nginx/docker-template-web
RUN chmod -R 764 /var/log/nginx/docker-template-web

# php-fpm, nginx起動
CMD ["/bin/sh", "/export/www/docker-template-web/scripts/start_libs.sh"]

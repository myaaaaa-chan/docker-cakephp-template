FROM centos:centos7.9.2009

# OSアップデート
RUN yum -y update

# 各種ライブラリインストール
RUN yum install -y vim
RUN yum install -y unzip
RUN yum install -y less

# postgresユーザ作成
RUN useradd postgres

# postgresqlインストール
RUN yum install -y epel-release centos-release-scl
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y install postgresql14 postgresql14-server postgresql14-contrib postgresql14-devel

# 作業ディレクトリ作成
RUN mkdir -p /export/pgdata/psql14
RUN chmod 700 /export/pgdata/psql14
RUN chown postgres:postgres /export/pgdata/psql14

# postgresユーザに切り替え
USER postgres

ENV PATH $PATH:/usr/pgsql-14/bin
ENV PGDATA /export/pgdata/psql14
ENV PGPORT 5432

CMD ["/bin/sh", "/export/www/docker-template/docker/db/start.sh"]

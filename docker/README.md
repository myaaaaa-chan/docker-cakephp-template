# web,db構築手順

## docker-compose
docker-compose.ymlがあるディレクトリで

```
docker-compose up -d
```

#####確認
- http://localhost:80 にアクセスして、CakePHP4のデフォルトビューが表示されること
- doc/development配下のファイルはdockerコンテナと共有されている


## データベース設定

- 設定ファイルは`docker/db/pgdata`以下にある


### pg_hba.confの設定
以下を追加
```
host    all             all             0.0.0.0/0               trust
```

### postgresql.confの設定
以下を追加
```
listen_addresses = '*'
```

## ホストと同一のネットワークにあるデータベースに接続する場合
##### ホストからデータベースサーバへsshポートフォワーディングの設定をする

例)ssh -L -N 15432:127.0.0.1:5432 [データベースサーバIP]

```
ssh -i ~/[path_to_id_rsa]/id_rsa -L 15432:127.0.0.1:5432 postgres@xxx.xxx.xxx.xxx -N -f
```

### CakePHPのapp.configを変更する
```
    'Datasources' => [
        'default' => [
            'className' => \Cake\Database\Connection::class,
            'driver' => \Cake\Database\Driver\Postgres::class,
            'host' => 'host.docker.internal',
            'port' => 15432,
            'username' => 'postgres',
            'password' => '',
            'database' => 'データベース名',
            // 以下省略
        ],
    ],
```

##### `host.docker.internalはdocker`コンテナから見て、ホストのIPを指す


##Webのnginx,PHP,php-fpmの

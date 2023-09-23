# gooooooooooooooooooooooose

## Dockerhub

[here](https://hub.docker.com/repository/docker/yoshi429/goose-migration/general)

## Directory structure

workdir is `go/src`

```zsh
.
├── Dockerfile
├── README.md
├── db
│   └── *sql
└── entrypoint.sh
```

## goose install

```
# mac 
go install github.com/pressly/goose/v3/cmd/goose@latest
```

```
# wsl, ubuntuの場合
cd /backend/db/migrations
git clone https://github.com/pressly/goose
cd goose
go mod tidy
go build -o goose ./cmd/goose

./goose --version
# コマンド実行するときはここのpathでcd /backend/db/migrations
cd /backend/db/migrations;
GOOSE_DRIVER=postgres GOOSE_DBSTRING="host=localhost port=5432 user=postgres dbname=postgres password=password sslmode=disable" ./goose/goose up;
```

### ready for use goose

goose_db_versionの追加

```zsh
GOOSE_DRIVER=postgres GOOSE_DBSTRING="host=localhost port=5432 user=postgres dbname=postgres password=password sslmode=disable" goose status
```

ファイルのフォーマットを作成、編集

```zsh
cd backend/db/migrations
goose create create_user sql
```

### how to execute

実行

```zsh
# Macの場合
# move to directory which is exist sql files
cd backend/db/migrations

# migration
GOOSE_DRIVER=postgres GOOSE_DBSTRING="host=localhost port=5432 user=postgres dbname=postgres password=password sslmode=disable" goose up
```

```zsh
# WSLの場合
# move to directory which is exist sql files
cd backend/db/migrations

# migration
GOOSE_DRIVER=postgres GOOSE_DBSTRING="host=localhost port=5432 user=postgres dbname=postgres password=password sslmode=disable" ./goose/goose up
```

実行後自動的にgoose-veserion更新される

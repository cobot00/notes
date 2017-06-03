# Docker

## インストール & セットアップ

### VM生成
```bash
cd [Docker_Toolbox_HOME]
./start.sh
```

### VMへの接続設定
```bash
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="C:\Users\[user_name]\.docker\machine\certs"
export DOCKER_MACHINE_NAME="default"
```

## コマンド

```
docker ps
docker images
docker ps -a -q | xargs docker rm

docker build -t [REPOSITORY]:[TAG] .
docker build -t ruby24:test .

docker create [REPOSITORY]:[TAG] --name [CONTAINER_NAME]
docker create --name ruby24 ruby24:test

docker start [CONTAINER ID] or [CONTAINER_NAME]
docker ruby24 -a

docker run -it --name [コンテナ名] [REPOSITORY]:[TAG]

docker run -it --name ruby24 ruby24:test
```

```bash
cd [APP_HOME]
docker build -t ruby24:test .
```

```bash
docker run --rm -v "$PWD":/myapp ruby24:test ruby simple.rb

docker run --rm -v //c/coding/docker-rails:/myapp ruby24:test ruby simple.rb
```

## docker build
### Ruby  & Rails

1-1. Gemfileの作成

```ruby
source "https://rubygems.org"
gem 'rails', '5.1.1'
```

2-2. Gemfile.lockの作成

```bash
touch Gemfile.lock
```


## メモ
```
Sending build context to Docker daemon  3.072kB
Step 1/8 : FROM ruby:2.4.0
 ---> 6ec7e9c998da
Step 2/8 : RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
 ---> Using cache
 ---> d173fffeb2a1
Step 3/8 : RUN mkdir /myapp
 ---> Using cache
 ---> 290d21e77717
Step 4/8 : WORKDIR /myapp
 ---> Using cache
 ---> 82747b281423
Step 5/8 : ADD Gemfile /myapp/Gemfile
lstat Gemfile: no such file or directory
```

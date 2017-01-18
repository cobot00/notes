# Heroku覚書

## Herokuコマンド
```bash
heroku login

heroku keys:add

heroku apps:create [app_name]
heroku create

heroku config

heroku open

heroku logs
```

## MySQL用のアドオンの登録

```bash
heroku addons:add cleardb:ignite

heroku config | grep CLEARDB_DATABASE_URL

heroku config:set DATABASE_URL='mysql2://<username>:<password>@<host>/<database>?reconnect=true'

heroku config
```

## Redis用のアドオンの登録
```bash
heroku addons:add redistogo

git remote add heroku git@heroku.com:app-practice.git

git remote rm heroku

git push heroku master
```

## DBマイグレーション
```bash
heroku run rake db:migrate
```

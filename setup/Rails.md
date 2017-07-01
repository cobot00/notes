# Rails Note

```bash
sudo apt-get install -y g++ make
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
sudo apt-get install -y sqlite3 libsqlite3-dev nodejs
sudo apt-get install -y libmysqld-dev libmysqlclient-dev mysql-server mysql-client
sudo apt-get install -y postgresql postgresql-contrib libpq-dev

gem install bundler
gem install rails --version="~> 4.2" --no-ri --no-rdoc
```

## GENERATOR

```bash
rails generate [GENERATOR] [OPTIONS]

rails generate scaffold users name:string country_code:integer
rails generate scaffold todo title:string finished:boolean
```

代表的な `GENERATOR`

* scaffold
  - 全ての要素を生成する
  - CRUDのAPIならコマンドだけで完成する
* controller
  - model、migration以外の要素を生成する
* model
  - modelとmigrationスクリプトの生成
* migration
  - migrationスクリプトの生成
* task

## migration

```bash
bin/rake db:migrate
bin/rake db:migrate RAILS_ENV=test

bin/rake db:rollback
bin/rake db:rollback RAILS_ENV=test
```

### PostgreSQL
`timestamp with time zone` 型は直接指定するしかない？

```ruby
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: false do |t|
      t.column :user_id, 'SERIAL PRIMARY KEY'
      t.string :name, null: false, limit: 50
      t.integer :country_code
      t.date :birth

      t.column  :created_at, 'timestamp with time zone'
      t.column  :updated_at, 'timestamp with time zone'
    end
  end
end
```

### Heroku
```bash
heroku run rake db:migrate
heroku run rake db:rollback


```

## ルーティング

```bash
bin/rake routes
```

## puma
`config/puma.rb`

```ruby
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
```

```bash
bundle exec puma -C config/puma.rb
```

## メモ
```bash
curl -i -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"name":"hoge","country_code":2}'  http://localhost:3000/users

curl -i -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"name":"hoge","country_code":2}'  https://rails-api-pg.herokuapp.com/users
```

# Ruby Note

## rbenv
### For Ubuntu
```bash
sudo apt-get install -y git build-essential libssl-dev libffi-dev libreadline-dev

cd ~
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

```bash
vi ~/.bash_profile

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

### For Mac
```bash
brew install rbenv ruby-build

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```

```bash
rbenv install --list

rbenv install 2.4.1
rbenv global 2.4.1
rbenv rehash

ruby -v
```

#### version up
```bash
brew upgrade ruby-buil
```

### For Windows

* rubyinstaller
https://rubyinstaller.org/downloads/

* 基本セット

```bash
cd [DevKit_HOME]
ruby dk.rb init
ruby dk.rb install

[RUBY_HOME]/lib/ruby/site_ruby/devkit.rb
```

```bash
gem update --system

gem install bundler
gem install pg -v "~> 0.20.0"
```

* Rails

```bash
gem install rails --version="~> 5.0.0" --no-ri --no-rdoc

rails new [APP_NAME] -d postgresql
```

## Ruby
```bash
rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1
ruby --version
```

## Bundler
```bash
gem install bundler
```

## Windows by RubyInstaller2
https://github.com/oneclick/rubyinstaller2/releases

インストール後に `[RUBY_HOME]/bin` へのPATHを環境変数に追加する

### MSYS2
http://qiita.com/akaneko3/items/26d758e9e84ad213697f

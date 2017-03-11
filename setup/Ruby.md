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

## Ruby
```bash
rbenv install 2.3.1
rbenv rehash
rbenv global 2.3.1
ruby --version
```

## Bundler
```bash
gem install bundler
```


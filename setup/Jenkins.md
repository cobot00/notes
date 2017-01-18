# Jenkins Setup

## Java install
### For Ubuntu
```bash
sudo apt-add-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk

[check]
java -version
javac -version
```

## Jenkins Install
### For Ubuntu
```bash
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
```

### For Windows
1. Download zip from [jenkins](https://jenkins.io/) (use 2.32.1 in this case).
2. execute `jenkins.msi` after expand zip.

## Jenkins Theme Change
http://jenkins-contrib-themes.github.io/jenkins-material-theme/
```
https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-cyan.css
```

## Jenkins Theme
install below plugin.
```
Simple Theme Plugin
```

### jenkins-material-theme

#### 1. through network
[jenkins-material-theme](http://afonsof.com/jenkins-material-theme/)
```
https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-cyan.css
```

#### 2. arranged in local
2-1. dowload `material-light.css`  
2-2. `material-light.css` is localted in `[JENKINS_HOME]/userContent`  

## Jenkins SSH Key
```bash
sudo su - jenkins

ssh-keygen -t rsa -C cobotjenkins@gmail.com
cat /var/lib/jenkins/.ssh/id_rsa.pub

git config --global user.email "hoge@hoge.com"
git config --global user.name "hoge"
```

## Hub Install(GitHub tool)
```bash
cd /tmp
git clone https://github.com/github/hub.git
cd hub/
./script/build
cp hub /usr/local/bin/
```

hub pull-request -b master -h test -a cobot-jenkins

## Nginx Install
### For Ubuntu
```bash
sudo apt-get install nginx

[check]
nginx -v
```

#### Nginx conf
```bash
sudo vi /etc/nginx/sites-available/default
```

```
server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /usr/share/nginx/html;
    index index.html index.htm;

    # Make site accessible from http://localhost/
    server_name localhost;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        if (!-f $request_filename) {
            proxy_pass http://localhost:8080;
            break;
        }
    }
}
```

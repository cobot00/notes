alias vb='vi ~/.bash_profile'
alias sb='source ~/.bash_profile'

alias be='bundle exec'
alias bi='bundle install'
alias gitl='git log --graph --all --decorate --abbrev-commit --branches --oneline'
alias awake_heroku='curl http://rionbot.herokuapp.com/'

export PATH=$PATH:$HOME/.embulk/bin

# For Mac
PS1='\u \W$ '
echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"

function chpwd() {
    echo -ne "\033]0;$(pwd | rev | awk -F \/ '{ print "/"$1"/"$2 }'| rev)\007"
}
eval "$(rbenv init -)"

alias mysqls='mysql.server start'

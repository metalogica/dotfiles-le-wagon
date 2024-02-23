#!/bin/bash
alias dotfiles="code \$DOTFILES_DIR"
alias shakepay_backend="code \$SHAKEPAY_DIR/shake-hosted-wallet"
alias shakepay_app="code \$SHAKEPAY_DIR/shaketh"
alias shakepay_cicd="code \$SHAKEPAY_DIR/shake-ci-cd"

# Git
## git pull origin master
alias gpo="/opt/homebrew/bin/git pull origin"
## git push
alias gp="/opt/homebrew/bin/git push"
## git add
alias ga="/opt/homebrew/bin/git add"
## git status
alias gst="/opt/homebrew/bin/git status"
## git diff
alias gd="/opt/homebrew/bin/git diff "
## git log
alias gl="/opt/homebrew/bin/git log"
## git stash
alias gsh="/opt/homebrew/bin/git stash"
## git restore
alias gr="/opt/homebrew/bin/git restore"
# git line stats
alias gs="/opt/homebrew/bin/git diff --stat origin/master HEAD"
# show mostrcent working branches
alias gw="git for-each-ref --sort=committerdate refs/heads/"
# delete branch
alias gdel="git branch --delete -D"
# switch to master branch
alias gma="git co master"
# switch to previous branch
alias gsw="git switch -"
## git commit
gc () {
    '/opt/homebrew/bin/git' commit -m "$1"
}
## git push origin upstream
gpu () {
    git push origin -u `() { git rev-parse --abbrev-ref HEAD }`
}
## get last commit url
alias gurl="get_last_commit_url"

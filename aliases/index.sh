#!/bin/bash
source "$DOTFILES_DIR/aliases/user.sh"
source "$DOTFILES_DIR/aliases/shakepay.sh"

# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

# BTC Core and Electrum
alias electrum="open -n /Applications/Electrum.app --args --testnet"

# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8000'  # Or python -m SimpleHTTPServer :)

# IDE aliases
## apps
alias nv=/opt/homebrew/bin/nvim

## launch config files
alias conf="nv +':@c'"

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
## git commit
gc () { '/opt/homebrew/bin/git' commit -m "$1" }
## git push origin upstream
gpu () { git push origin -u `() { git rev-parse --abbrev-ref HEAD }` }
# rebase to master
# does not work
#alias gres="/opt/homebrew/bin/git git reset $(git merge-base master $(git branch --show-current))"
# show mostrcent working branches
alias gw="git for-each-ref --sort=committerdate refs/heads/"
alias gdel="git branch --delete -D"

# use exa for ls
alias l="lc"

# Docker
alias dockerc="docker container"
alias dockeri="docker image"
alias dockere="docker exec -it"
alias doco="docker compose"

# Jupyter Notebook
alias jt="jupyter notebook"

# dharma taylor
alias dharmataylor="ssh -i \"dharmataylor.pem\" ubuntu@ec2-18-130-97-77.eu-west-2.compute.amazonaws.com"

# supabase
alias supa="/opt/homebrew/bin/supabase"

# custom scripts
alias heic_to_pdf="/Users/richardjarram/zsh/heic_to_jpeg.sh"

# Shortcut paths
alias GTD="/Users/richardjarram/Documents/GTD"

# functions
convert_to_webp() {
    input_file="$1"
    output_file="${input_file%.*}.webp"
    
    cwebp -q 50 "$input_file" -o "$output_file"
}

# npm
alias nr="npm run"
alias nrw="npm run -w"

# jupyter
alias jn="jupyter notebook"

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

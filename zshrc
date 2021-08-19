# le wagon setup
ZSH=$HOME/.oh-my-zsh
# Create custom ENV variables
export CODE=~/code/catonmat
#export PRINTER_ID=yap_001
#export PRINTER_EMAIL=richard@yap.cx
#export PRINTER_TOKEN=RLxpdbr3F5U_6iZfdo3H

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="majemoji"

# Useful plugins for Rails development with Sublime Text
plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search docker docker-compose)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# add clustalw2 (for ANDES covid project) to path
export PATH="${PATH}:${CODE}/ANDES/clustalw2"

# add clustal omega ot path
export PATH="${PATH}:~/.python-scripts/clustalo"

# add postgres 12 to path
export PATH="${PATH}:/usr/local/opt/krb5/bin:/usr/local/opt/krb5/sbin"
export LDFLAGS="-L/usr/local/opt/krb5/lib"
export CPPFLAGS="-I/usr/local/opt/krb5/include"
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

# data science additions
# Load pyenv (To manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenv activate lewagon 2>/dev/null && echo "🐍 Loading 'lewagon' virtualenv"









# personal additions
# Yap Printer Dev Variables
export PRINTER_ENV=DEVELOPMENT
export PRINTER_ID=yap_001
export PRINTER_EMAIL=richard@yap.cx
export PRINTER_TOKEN=RLxpdbr3F5U_6iZfdo3H

# Rust Paths
export CARGO_HOME=/Users/richardjarram/.cargo/bin
export RUSTUP_HOME=/Users/richardjarram/.rustup
export PATH="${PATH}:/Users/richardjarram/.cargo/bin/bin"

# Docker aliases
alias docker-vm='docker run -it --rm --privileged --pid=host justincormack/nsenter1'

# custom prompt
#% PROMPT='%~ %# '

# Githack
alias githack='source ~/.zsh_scripts/githack.sh'

# Build popular directories
#dirs -c
#pushd $CODE/yap-backend >/dev/null && pushd $CODE/yap-trading-tool > /dev/null && pushd $CODE/yap-admin-console >/dev/null

# Use VS Code as preferred git merge resolve text editor
git config --global core.editor "code --wait"

# Add Alias for Yap Backup Scripts
alias yap-db-backup-staging='heroku pg:backups:capture --app yap-bms-backend-staging-env && heroku pg:backups:download -o $CODE/yap-db-backups/staging_`date +%s` --app yap-bms-backend-staging-env >/dev/null && echo "staging Db successfully backed up."'

alias yap-db-backup-production='heroku pg:backups:capture --app yap-bms-backend-production-env && heroku pg:backups:download -o $CODE/yap-db-backups/production_`date +%s` --app yap-bms-backend-production-env >/dev/null && echo "Production DB successfully backed up."'

# Move to desired directory
# cd $CODE

# After installing rbenv-gemset:
# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following line to your .zshrc (below)
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use openSSL <1.1.
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# NVM settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash completion

# open ssl 1.1
export PATH="${PATH}:/usr/local/opt/openssl@1.1/bin"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# aff flutter to path
export PATH="${PATH}:~/.flutter/bin/flutter"
alias flutter=~/.flutter/bin/flutter

# alias k8s
alias k=kubectl

# unity
alias unity=/Applications/Unity/Hub/Editor/2019.4.5f1/Unity.app/Contents/MacOS/Unity

export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

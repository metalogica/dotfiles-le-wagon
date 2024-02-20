#/bin/bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config/"

# le wagon setup
ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Useful plugins for zsh
plugins=(
  gitfast
  last-working-dir
  common-aliases
  sublime
  zsh-syntax-highlighting
  history-substring-search
  docker
  docker-compose
  wd
  # zsh-autosuggestions
)

# exa ls
alias lc='exa --long --header --git --icons'

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# direnv
eval "$(direnv hook zsh)"

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# add postgres to path
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
export RETOOL_DIR="/Users/richardjarram/code/shakepay/retool"

# data science additions
# Load pyenv (To manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# activate le wagon python environment
pyenv activate lewagon 2>/dev/null # && echo "🐍 Loading 'lewagon' virtualenv"
eval "$(pyenv virtualenv-init -)"

# Rust Paths
export CARGO_HOME=/Users/richardjarram/.cargo/bin
export RUSTUP_HOME=/Users/richardjarram/.rustup
export PATH="${PATH}:/Users/richardjarram/.cargo/bin/bin"

# cpp config
export CPP_PACKAGES="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
export VCPKG_ROOT="/Users/richardjarram/vcpkg"

# Docker aliases
alias docker-vm='docker run -it --rm --privileged --pid=host justincormack/nsenter1'

# Use VS Code as preferred git merge resolve text editor
git config --global core.editor "code --wait"

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following line to your .zshrc (below)
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use openSSL <1.1.
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# NVM settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash completion

# open ssl 1.1
export PATH="${PATH}:/usr/local/opt/openssl@1.1/bin"
export LDFLAGS="-L/opt/homebrew/lib"; export CPPFLAGS="-I/opt/homebrew/include"

# FLAGS
## openssl 1.1
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
## pyenv envs
export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"

# alias k8s
alias k=kubectl

export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

# shakepay devops-tools setup
source ~/.config/shakepay/devops-tools
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono:$PATH"

# bun completions
[ -s "/Users/richardjarram/.bun/_bun" ] && source "/Users/richardjarram/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rediff
export RETOOL_DIR="/Users/richardjarram/code/shakepay/retool"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/richardjarram/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"

# else
#    if [ -f "/Users/richardjarram/.miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/richardjarram/.miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/richardjarram/.miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# test

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi


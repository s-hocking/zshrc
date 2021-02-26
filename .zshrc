# ANDROID CMD LINE TOOLS
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools/bin
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/platform-tools

# COLOURS
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# ALIASES
alias ll='ls -lahGF'

# Git Aliases
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gf='git fetch -p'

# HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY

# History size
SAVEHIST=5000
HISTSIZE=2000

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# GIT BRANCH STATUS
source ~/Documents/checkouts/open-source/zsh-git-prompt/zshrc.sh

# GIT BRANCH AUTOCOMPLETE
autoload -Uz compinit && compinit

# PROMPT
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
RPROMPT='$(git_super_status)'

# rbenv / Ruby / Homebrew OpenSSL
eval "$(rbenv init -)"

# After installing rbenv via Homebrew, this message is printed:
# 
# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# 
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your ~/.zshrc:
#   export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
#
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use
# OpenSSL <1.1.
#
# With that in mind, here is the additional export:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

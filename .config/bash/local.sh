# bash env

#echo profile.bash start

if [ -f ~/.profile ]; then
	. ~/.profile
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# fzf

# fzf will launch interactive finder, read the list from STDIN, and write the selected item to STDOUT.
# find * -type f | fzf > selecte

# Without STDIN pipe, fzf will traverse the file system under the current directory to get the list of files.
# vim $(fzf)
#  or
# fzf --print0 | xargs -0 -o vim

# https://github.com/junegunn/fzf?tab=readme-ov-file#search-syntax

#source /opt/homebrew/opt/fzf/shell/completion.bash
eval "$(fzf --bash)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#export EDITOR=/usr/bin/vim
export LESS='-R'
#export LESSOPEN='|~/.lessfilter %s'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# tab completions
# brew install bash-completion@
# if type brew &>/dev/null; then
#   HOMEBREW_PREFIX="$(brew --prefix)"
#   for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
#     [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
#   done
# fi
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# history
HISTCONTROL=ignoreboth:erasedups
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# aliases

# enable color support of ls and also add handy aliases
# brew install coreutils; export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
if command -v dircolors > /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

#echo profile.bash end

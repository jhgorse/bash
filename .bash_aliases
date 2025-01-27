#!/bin/bash

alias ls='LSCOLORS=gxfxcxdxbxexexabagacad /bin/ls -bFHGLOPW'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias add='edit ~/.bash_aliases;source ~/.bash_aliases'
alias erc='edit ~/.bashrc;source ~/.bashrc'

alias vcsh-bash-enable="echo '[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt' >> ~/.config/bash/local.sh"
alias get-liquid-prompt="cd;git clone https://github.com/nojhan/liquidprompt .liquidprompt && vcsh-bash-enable"

alias vcsh-bash-commit-push='vcsh bash commit -m "updates";vcsh bash push'
alias vcsh-bash-pull='vcsh bash pull'

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias rofi='rofi -show run'
alias la='ls -la'
alias ll='ls -l'
alias ..='cd ..'
alias sx='startx'
alias sd='shutdown now'
alias open='xdg-open'
alias jup='jupyter lab'
alias time='sudo hwclock -s'
alias py='python3'
alias rr='ranger'
alias v='vim'
alias rb='reboot'
alias du1='du --max-depth=1 -h'

alias trade='tradingview & brave --app-id=mdgacmegdapeabbgeipilljdhmibgobo & brave --app-id=dgjelipecbboepmgmphabimaihmnndno'

PS1='[\u@\h \W]\$ '


eval "$(starship init bash)"

# export PATH="/usr/bin/python3.9:$PATH"
# alias python='python3.9'

export PATH="/home/vp/.local/bin/:$PATH"
# alias pip='pip3'

export RANGER_LOAD_DEFAULT_RC=FALSE

source /home/vp/.config/broot/launcher/bash/br



# Dotfiles management
alias dtf='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dtfs='dtf status'
alias dtfminor='dtf status && dtf add -u && dtf commit -m "minor changes" && dtf push'

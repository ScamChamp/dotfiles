#ZSHRC

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export HISTFILE="$HOME/.zsh/.history"
HISTSIZE=1000
SAVEHIST=1000

alias vi=vim
alias vim=nvim
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^ ' autosuggest-accept
zstyle ':vcs_info:*' enable git
PS1='%B%F{#22211c}[%f%F{#958962}%2d%f%F{#22211c}]%f %F{#5f819d}$%f%b '



alias vim=nvim
alias vi=nvim
source /home/pranshu/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#ZSHENV

export ENV_VAR=12345
export TERMINAL=st
export NNN_PLUG='p:preview-tui;g:gitroot'
export NNN_FIFO=/home/pranshu/nnn.fifo
export EDITOR="/bin/ec"
export SHELL=/bin/zsh
export PAGER=nvim
export lesshistfile="-"
NNN_FCOLORS='00009589000000000000000000'

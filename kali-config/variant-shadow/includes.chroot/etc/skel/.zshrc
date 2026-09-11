# Shadow GNU/Linux - Zsh configuration
#
# Lightweight two-line prompt: user@hostname ☯ directory, with a
# root/non-root distinction. No heavy shell frameworks.

# --- History --------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# --- Completion ------------------------------------------------------------
autoload -Uz compinit
compinit

# --- Key bindings ----------------------------------------------------------
bindkey -e

# --- Prompt ---------------------------------------------------------------
# Line 1: user@hostname  ☯  current-directory
# Line 2: prompt symbol that reflects root (%#) vs non-root (%)
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%F{cyan}%m%f %F{yellow}☯%f %F{blue}%~%f
%F{green}%#%f '

# --- Aliases ---------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b 2>/dev/null)" || true
fi
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Terminal size persistence wrapper (restores last manual resize)
alias open-terminal='~/.local/bin/shadow-terminal'

# --- Useful small functions -------------------------------------------------
mkcd() { mkdir -p "$1" && cd "$1"; }
ff()   { find . -name "*$1*" -type f 2>/dev/null; }
fd()   { find . -name "*$1*" -type d 2>/dev/null; }
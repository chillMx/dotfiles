#!/usr/bin/env bash

# Navigation
setopt AUTO_CD            # Go to folder without cd

setopt AUTO_PUSHD         # Push currnet dir onto stack
setopt PUSHD_IGNORE_DUPS  # Don't store duplicates
setopt PUSHD_SILENT       # Don't print stack right away

# Source aliases
source ~/.config/zsh/aliases

# Completion
autoload -U compinit; compinit
_comp_options+=(globdots)       # Includes hiden files

# Prompt
fpath=(~/.config/zsh/prompt $fpath)
autoload -Uz prompt_purification_setup && prompt_purification_setup

# Vi mode
bindkey -v           # Enable Vi mode
export KEYTIMEOUT=1  # Switch faster

# Switch between beam and block
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Vi keybinds in completions
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Plugins
source /home/chill/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

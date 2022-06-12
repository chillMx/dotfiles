#!/usr/bin/env zsh

#################################
# EXPORT ENVIRONMENTAL VARIABLE # 
#################################

# Set XDG Base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACE_HOME="$XDG_CONFIG_HOME/cache"

# Set default editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"  # History filpath
export HISTFILE=10000                 # Max events in internal history
export SAVEHIST=10000                 # Max entries in history file

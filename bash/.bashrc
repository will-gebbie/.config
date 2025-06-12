if [ -f ~/.config/bash/.bash_aliases ]; then
    source ~/.config/bash/.bash_aliases
fi

# Set bash in vi mode
set -o vi


# fzf variables
export FZF_DEFAULT_COMMAND='fd -L -I -t f -t l'
export FZF_DEFAULT_OPTS='--height 85% --tmux center,85% --multi --style full --pointer='▶' --margin 10%,5% --layout reverse --border rounded --preview-window hidden --bind ctrl-/:toggle-preview --preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-label="| File Contents |" --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#313244,label:#CDD6F4'

export FZF_ALT_C_OPTS='--height 60% --tmux center,60% --style full --pointer='▶' --margin 10%,5% --layout reverse --preview "tree -C {}"
	--preview-label="| Directories |" --border-label="| Change Directory |"'

export FZF_CTRL_R_OPTS='--height 60% --tmux center,60% --style full --pointer='▶' --margin 10%,5% --layout reverse --preview ""
	--border-label="| Command History |"'

# fzf alt-c rebind to ctrl-e
bind -m emacs-standard '"\C-e": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"\C-e": "\C-z\ec\C-z"'
bind -m vi-insert '"\C-e": "\C-z\ec\C-z"'


# tmuxp
export TMUXP_CONFIGDIR=$HOME/.config/tmuxp

# Custom Functions

a () {
  mamba activate "$(mamba info --envs | fzf | awk '{print $1}')"
}

eval "$(starship init bash)"

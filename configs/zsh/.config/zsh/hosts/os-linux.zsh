# Enable Emacs key bindings (recommended default)
bindkey -e

# Standard keys
bindkey "^[[3~" delete-char        # Del key
bindkey "^H" backward-delete-char  # Backspace (usually already set)

# Home/End fallback compatibility
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# Ctrl + Arrow keys
bindkey "^[[1;5C" forward-word     # Ctrl + →
bindkey "^[[1;5D" backward-word    # Ctrl + ←

# TMUX Sessionizer
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\ej' "tmux-sessionizer -s 1\n"
bindkey -s '\ek' "tmux-sessionizer -s 2\n"
bindkey -s '\el' "tmux-sessionizer -s 3\n"

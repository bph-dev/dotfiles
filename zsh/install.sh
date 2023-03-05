#!/usr/bin/sh

cat >> "$HOME/.zshrc" <<EOF
# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
  for rc in ~/.zshrc.d/*; do
    if [ -f "\$rc" ]; then
      . "\$rc"
    fi
  done
fi
unset rc

# kubectl completion
#source <(kubectl completion bash | sed s/kubectl/k/g)
EOF

"$SYM_LINK" "$LOCAL_PROJ/zshrc.d/zsh_aliases" "$HOME/.zshrc.d/zsh_aliases"
"$SYM_LINK" "$LOCAL_PROJ/zshrc" "$HOME/.zshrc"

source "$HOME/.zshrc"


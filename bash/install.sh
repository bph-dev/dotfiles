#!/usr/bin/sh

cat >> "$HOME/.bashrc" <<EOF
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "\$rc" ]; then
      . "\$rc"
    fi
  done
fi
unset rc

# kubectl completion
#source <(kubectl completion bash | sed s/kubectl/k/g)
EOF

"$SYM_LINK" "$LOCAL_PROJ/bashrc.d/bash_aliases" "$HOME/.bashrc.d/bash_aliases"


export CLICOLOR=1

MYEMAIL="zaemyung@gmail.com"
MYNAME="zaemyung"

# Aliases
alias sourceb='source ~/.bashrc'
alias l='ls -alhF'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

alias gitst='git status'
alias gitadd='git add -A .'
gitcom () { git commit -m "$@"; }
gitsetconfig () {
    git config --global user.name "$MYNAME";
    git config --global user.email "$MYEMAIL";
}

genssh () {
    ssh-keygen -t ed25519 -C "$MYEMAIL";
    cat ~/.ssh/id_ed25519.pub;
}

if [[ $TMUX ]]; then
    alias clear='clear && tmux clear-history'
fi

alias venvac='. venv/bin/activate'

source ~/z/z.sh

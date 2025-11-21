#### General identity ####
export MYEMAIL="zaemyung@gmail.com"
export MYNAME="zaemyung"

#### Bash completion & case-insensitive matching ####
# Enable bash-completion if available (Ubuntu usually has this)
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Case-insensitive completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

#### colorls setup (Ruby gem) ####
if command -v ruby >/dev/null 2>&1 && command -v gem >/dev/null 2>&1; then
  GEM_BINDIR="$(ruby -e 'puts Gem.bindir' 2>/dev/null)"
  [ -n "$GEM_BINDIR" ] && PATH="$PATH:$GEM_BINDIR"

  if gem which colorls >/dev/null 2>&1; then
    COLORLS_COMPLETE_SH="$(dirname "$(gem which colorls)")/tab_complete.sh"
    [ -f "$COLORLS_COMPLETE_SH" ] && . "$COLORLS_COMPLETE_SH"
  fi
fi

#### Custom ls-like function "l" with counts ####
unalias l 2>/dev/null

l() {
  local recursive=0
  if [[ "$1" == "-r" ]]; then
    recursive=1
    shift
  fi

  # Colors
  local GREEN BLUE YELLOW RED BOLD RESET
  GREEN="$(tput setaf 2 2>/dev/null || printf '')"
  BLUE="$(tput setaf 4 2>/dev/null || printf '')"
  YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
  RED="$(tput setaf 1 2>/dev/null || printf '')"
  BOLD="$(tput bold 2>/dev/null || printf '')"
  RESET="$(tput sgr0 2>/dev/null || printf '')"

  # Depth control
  local DEPTH_ARGS=("-mindepth" "1" "-maxdepth" "1")
  (( recursive )) && DEPTH_ARGS=("-mindepth" "1")

  # Use colorls if available, else plain ls
  if command -v colorls >/dev/null 2>&1; then
    colorls -lA --sd --dark "$@"
  else
    ls -lA "$@"
  fi

  # Counts
  local files dirs hidden_files
  files=$(find . "${DEPTH_ARGS[@]}" -type f ! -name ".*" 2>/dev/null | wc -l)
  dirs=$(find . "${DEPTH_ARGS[@]}" -type d ! -name ".*" 2>/dev/null | wc -l)
  hidden_files=$(find . "${DEPTH_ARGS[@]}" -type f -name ".*" 2>/dev/null | wc -l)

  local FILE_COLOR=$RED
  [[ "$files" -gt 0 ]] && FILE_COLOR=$GREEN

  echo ""
  printf "%s📄 Files:%s %s%s%s  " "$BOLD" "$RESET" "$FILE_COLOR" "$files" "$RESET"
  printf "%s📁 Dirs:%s %s%s%s  " "$BOLD" "$RESET" "$BLUE" "$dirs" "$RESET"
  printf "%s👁️ Hidden files:%s %s%s%s\n" "$BOLD" "$RESET" "$YELLOW" "$hidden_files" "$RESET"
}

#### Directory shortcuts ####
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

#### Git helpers ####
alias gitst='git status'
alias gitadd='git add -A .'

gitcom() {
  git commit -m "$@"
}

gitsetconfig() {
  git config --global user.name "$MYNAME"
  git config --global user.email "$MYEMAIL"
}

#### SSH key helper ####
genssh() {
  ssh-keygen -t ed25519 -C "$MYEMAIL"
  cat ~/.ssh/id_ed25519.pub
}

#### tmux clear-history integration ####
if [[ -n "$TMUX" ]]; then
  alias clear='clear && tmux clear-history'
fi

#### Python venv ####
alias venvac='. .venv/bin/activate'

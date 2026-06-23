source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# Lazy load nvm - only initialises when you first call nvm/node/npm
export NVM_DIR="$XDG_DATA_HOME/nvm"

nvm() {
  unfunction nvm node npm npx
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() { nvm; node "$@"; }
npm()  { nvm; npm  "$@"; }
npx()  { nvm; npx  "$@"; }

zmodload zsh/zprof
# source my configs
for f in "$ZDOTDIR"/{plugins,env,aliases,misc,tools}.zsh; do
  [[ -f "$f" ]] && source "$f"
done

zmodload zsh/zprof
# source my configs
for f in "$ZDOTDIR"/{plugins,env,aliases,misc,tools}.zsh; do
  [[ -f "$f" ]] && source "$f"
done

# prints any empty tickboxes in the notes path
# awk '/^[[:space:]]*- \[ \]/'  $NOTE_PATH
# awk '/^[[:space:]]*- \[ \]/{print; next} /[^ \t]/{gap=1; next} {if(gap){print "..."; gap=0}}' $NOTE_PATH
# awk '/^[[:space:]]*- \[ \]/{if(gap) print "..."; print; gap=0; next} /[^ \t]/{gap=1}' $NOTE_PATH
awk '/^[[:space:]]*- \[ \]/{if(gap && found) print "..."; print; gap=0; found=1; next} /[^ \t]/{gap=1}' $NOTE_PATH

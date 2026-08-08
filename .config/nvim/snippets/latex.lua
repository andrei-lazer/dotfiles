return {
  { prefix = "beg", body = "\\begin{${1:env}}\n\t$2\n\\end{$1}", desc = "LaTeX environment" },
  { prefix = "ff",  body = "\\frac{$1}{$2}",                    desc = "\\frac{}{}" },
  { prefix = "hr",  body = "\\href{${1:url}}{${2:display name}}", desc = "href{}{}" },
  { prefix = ";a",  body = "\\alpha", desc = "Greek alpha" },
  { prefix = ";b",  body = "\\beta",  desc = "Greek beta" },
  { prefix = ";g",  body = "\\gamma", desc = "Greek gamma" },
  { prefix = ";e",  body = "\\eps", desc = "Greek epsilon (only if macro is set)" },
  { prefix = "eq", body = "\\begin{equation}\n\t$1\n\\end{equation}", desc = "equation environment" },
  { prefix = "al", body = "\\begin{align}\n\t$1\n\\end{align}", desc = "align environment" },
}

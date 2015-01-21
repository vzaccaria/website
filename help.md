# Possible problems 

If you get a `spawn EMFILE` error, increase open file limits:

` > ulimit -n 10000 `

# Aliases

For common aliases: 

` > source useful-aliases `

# Shortcuts 

    ** Remember to specify target with -t !!*
    ./makefile.ls -- -w -r -t build         # watch and recompile assets
    ./makefile.ls -- -w -r                  # watch and recompile everything
    ./makefile.ls                           # generate makefile
    make deploy                             # upload everything
    make update                             # upload changes
     
Option `-r` Exposes the root (.) at localhost:4000

# Watch out for MathJax and Markdown 

For inline eqs, use \\(  \\) around the eq.

For display eqs:

* use $$ and $$ around the eq
* escape CRs \\ -> \\\\ 
* escape     \{ -> \\{

Check for * in equation as well (use \times)



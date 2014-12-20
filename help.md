# Description 

This directory holds my website. You can use almost always the makefile provided. Be sure however to update it everytime you add a file, with

   ./makefile.ls

Makefile targets:

1. To deploy into the standard website host by overwriting all files: 

   make deploy 

1. To just update, by sending only files that changed in size

   make update

2. To build the site

   make 

3. In order to live edit posts: 

   ./makefile.ls -- -w -r

   This watches for changes and recompiles. Exposes the root at localhost:4000

# Watch out for MathJax and Markdown 

For inline eqs, use \\(  \\) around the eq.
For display eqs:

* use $$ and $$ around the eq
* escape CRs \\ -> \\\\ 
* escape     \{ -> \\{



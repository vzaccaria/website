# Description 

This directory holds my website. There are basically two main targets for gulp.  

1. In order to live edit posts: 

   `cult dev`

   This watches for changes and recompiles. You can use the express server 
   on port 4000 to browse. 

2. To deploy into the standard website: 

   `cult deploy`

# Watch out for MathJax and Markdown 

For inline eqs, use \\(  \\) around the eq.
For display eqs:

* use $$ and $$ around the eq
* escape CRs \\ -> \\\\ 
* escape     \{ -> \\{


# Things to do

1. After setting up gulp in this directory, remember to patch:

   `node_modules/gulp-markdown/node_modules/marked/lib/marked.js` 

   by replacing it with:

   `tools/marked.js`

   cli: 

   `cp tools/marked.js node_modules/gulp-markdown/node_modules/marked/lib/marked.js`


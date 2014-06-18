

# Things to do

1. After setting up gulp in this directory, remember to patch:

   `node_modules/gulp-markdown/node_modules/marked/lib/marked.js` 

   by replacing it with:

   `tools/marked.js`

   cli: 

   `cp tools/marked.js node_modules/gulp-markdown/node_modules/marked/lib/marked.js`


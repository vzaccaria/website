map     = require('map-stream');
gutil   = require('gulp-util');
through = require('through2');
perror  = require('gulp-util').PluginError;
jade    = require('jade')
path    = require('path')
_       = require('underscore')
moment  = require('moment')
_.str   = require('underscore.string');

_.mixin(_.str.exports());
_.str.include('Underscore.string', 'string');

parse-path = (rpath) ->
  extname = path.extname(rpath)
  return {
    dirname: path.dirname(rpath)
    basename: path.basename(rpath, extname)
    extname: extname
  }

rename-path = (rpath, locals) ->
  date = locals.post.date 
  mm = moment(date)
  rpath.dirname = mm.format('YYYY/MM/DD');
  rpath.dirname = "#{locals.post.category}/#{rpath.dirname}"
  rpath.basename = rpath.basename.replace(/\d\d\d\d-\d\d-\d\d-/, "")
  return rpath

join-path = (dirname, basename, extname) ->
  path.join(dirname, basename+extname)

# File has the following structure 
#
# .path = final path of the file 
# .locals =
#    .post = metadata of the post 
# .contents = contents of the post
#

capture-info = (data) ->
  data.posts = []
  return map (file, cb) ->
       data.posts.push file.locals.post 
       cb(false, file)

render-index = (data, pc-info) -> 

  return map (file, cb) ->
      pc = {}
      for e in pc-info 
        nrm = path.normalize(file.cwd + "/" + e.name)
        if file.path == nrm
          pc := e 
      try 
        posts-filtered = data.posts
        console.log pc

        if pc.sort-by? and _.is-function(pc.sort-by) 
          posts-filtered := _.sort-by(posts-filtered, pc.sort-by)

        if pc.max-posts? and _.is-number(pc.max-posts)
          posts-filtered := _.head(posts-filtered, pc.max-posts)

        console.log posts-filtered.length

        locals = { filename: file.path, posts: data.posts, filtered-posts: posts-filtered }
        file.contents = new Buffer(jade.compile(file.contents, locals)(locals));
      catch 
        console.log "gulp-render-index: #e"
      cb(false, file)

render-blog-post = (templates, url) -> 

  return map (file, cb) ->
    layout = file.local.layout 
    
    if not layout? or not templates?[layout]? 

      console.log "gulp-render-blog-post: `#{layout}.jade` layout non existing - Bailing out"
      error = new perror("gulp-render-blog-post", "#{layout} non existing")
      cb(error, file)

    else 

      template = templates[layout]
      post     = _.extend { contents: file.contents }, file.local
      
      post.formatted-date = moment(post.date).format('dddd, MMMM Do YYYY')
      post.small-date = moment(post.date).format('M/D')
      post.small-description = _(post.description).prune(70, '..')

      locals   = 
          post: post
          filename: template.name 

      curpath       = parse-path(file.relative)
      curpath       = rename-path(curpath, locals)
      curpath       = join-path(curpath.dirname, curpath.basename, curpath.extname)
      file.contents = new Buffer(jade.compile(template.content, locals)(locals));
      post.link     = "#url/#curpath"
      post.image    = "#url/#{locals.post.og_image}"
      file.path     = path.join(file.base, curpath)
      file.locals   = locals

      cb(false, file)


module.exports = 
  render-blog-post: render-blog-post
  render-index: render-index
  capture-info: capture-info 
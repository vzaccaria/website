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

render-index = (data, pc-info, baseUrl) -> 

  return map (file, cb) ->
      pc = {}
      for e in pc-info 
        nrm = path.normalize(file.cwd + "/" + e.name)
        if file.path == nrm
          pc := e 
      try 
        posts-filtered = data.posts
        # console.log pc

        if pc.sort-by? and _.is-function(pc.sort-by) 
          posts-filtered := _.sort-by(posts-filtered, pc.sort-by)

        if pc.category? 
          posts-filtered := _.filter(posts-filtered, -> (it.category == pc.category))

        if pc.max-posts? and _.is-number(pc.max-posts)
          posts-filtered := _.head(posts-filtered, pc.max-posts)



        console.log "Rendering #{file.path} with #{posts-filtered.length} posts"

        locals = { filename: file.path, posts: data.posts, filtered-posts: posts-filtered, pretty: true, baseUrl: baseUrl }
        file.contents = new Buffer(jade.compile(file.contents, locals)(locals));
      catch 
        console.log "gulp-render-index: #e"
      cb(false, file)

render-container = (containers, baseUrl) ->
    return map (file, cb) ->
      try 
        workdir       = file.cwd
        sourcefile    = file.path
        relpath       = path.relative(workdir, sourcefile)
        data          = require(containers[relpath].source)


        for p in data 

          p.keyword ?= []
          p.type = 
            | 'bookc' in p.keyword      => 'bookchapter'
            | 'journal' in p.keyword    => 'journal'
            | 'book'    in p.keyword    => 'book'
            | 'conference' in p.keyword => 'conference'
            | 'techreport' in p.keyword => 'techreport'
            | 'workshop' in p.keyword   => 'workshop'
            | 'patent' in p.keyword     => 'patent'
            | 'techreport' in p.keyword => 'techreport'
            | 'talk' in p.keyword       => 'talk'
            | 'forum' in p.keyword       => 'talk'
            | 'thesis' in p.keyword     => 'thesis'
            | _                         => 'not categorized'


          if p.type == 'journal'
            p.booktitle = p.journal.name

          if p.type == 'thesis'
            p.booktitle = p.school 

          if p.type == 'techreport'
            p.booktitle = p.institution

          if p.type == 'patent'
            p.booktitle = "#{p.address} #{p.number}"

          if p.type == 'talk'
            p.booktitle = "#{p.address}"

          if not p.pages?
            p.pages = '—'

          if not p.link? 
            
            if not p['bdsk-url-1']?
              p.link = url: 'vittorio.zaccaria@polimi.it'
            else 
              p.link = url: p['bdsk-url-1']

          if p.booktitle?
            s  = p.booktitle
            n  = s.index-of(':')
            if n != -1
              s  = s.substring(0, n)
              p.smartbooktitle = s
            else 
              p.smartbooktitle = s



        locals        = { filename: file.path, data: data,  pretty: true, baseUrl: baseUrl }
        file.contents = new Buffer(jade.compile(file.contents, locals)(locals));
      catch 
        console.log "gulp-render-container: #e"
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
          pretty: true 
          baseUrl: url

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
  render-blog-post : render-blog-post
  render-index     : render-index
  capture-info     : capture-info
  render-container : render-container

sort-by-date = -> -1*(it.date.get-time!)

_module = ->

          
    iface = { 

      # main properties 
      destination:'_site'

      # note n2:  `site-base-url` should be a symbolic link to `destination`

      remote            : 'v2'
      site-base-url     : '/v2'

      vendor-js:
          "./assets/vendor/jquery.min.js"
          "./assets/vendor/dyncss.js"
          "./bower_components/fastclick/lib/fastclick.js"
          "./bower_components/angular/angular.min.js"
          "./bower_components/moment/moment.js"
          ...

      # client files 
      client-ls:
          "./assets/js/*.ls"
          ...

      client-brfy-roots: [ 'entry.js' ]

      client-html:
          "./assets/views/*.jade"
          "./assets/videos.jade"
          ...

      client-less:
          './assets/less/main.less'
          ...

      directives:[
          './assets/directives/*.sa'
          ]

      # vendor files 
      vendor-css:
          './assets/css/*.css'
          ...

      # other assets
      font-dir:'./assets/fonts'

      img-dir:'./assets/img'

      data-to-be-copied:[
          "./data/*.json"
          "./assets/less/*.dss"
          ]


      # Blog related properties:
      posts: 
        './posts/*.md'
        ...

      post_containers: 
        { name: './assets/index.jade'    , max-posts: 5          , sort-by: sort-by-date , category: 'blog' }
        { name: './assets/blog.jade'     , sort-by: sort-by-date , category: 'blog'}
        { name: './assets/teaching.jade' , sort-by: sort-by-date , category: 'infob'}
        ...

      # relative to the cwd without './'!
      containers: { 
        'assets/research.jade': { source: './data/biblio.json' } 
        'assets/projects.jade': { source: './data/projects.json' }
      }

      layout: {
        post: './assets/layouts/post.jade'
      }

      other-deps: [ 
                    './assets/layouts/base.jade', 
                    './assets/less/*.less', 
                    './assets/css/*.css', 
                    './assets/vendor/*.js',
                    './data/projects.json'
                    ]

    }
  
    return iface
 
module.exports = _module()
_module = ->

          
    iface = { 

      # main properties 
      destination:'_site'
      remote:'blog'

      site-base-url: ''

      vendor-js:
          "./assets/vendor/jquery.min.js"
          "./assets/vendor/dyncss.js"
          "./bower_components/fastclick/lib/fastclick.js"
          ...

      # client files 
      client-ls:
          "./assets/js/*.ls"
          ...

      client-brfy-roots: [ 'entry.js' ]

      client-html:
          "./assets/views/*.jade"
          ...

      client-less:
          './assets/less/main.less'
          ...

      directives:[
          './assets/directives/*.sjs'
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
        { name: './assets/index.jade', max-posts: 10, sort-by: -> -1*(it.date.get-time!) }
        ...

      layout: {
        post: './assets/layouts/post.jade'
      }

      other-deps: ['./assets/layouts/base.jade', './assets/less/*.less', './assets/css/*.css', './assets/vendor/*.js']

    }
  
    return iface
 
module.exports = _module()
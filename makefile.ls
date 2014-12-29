#!/usr/bin/env lsc 

{ parse, add-plugin } = require('newmake')

name = "_site"
ast-dst = "#name"
ast-src = "assets"

s = -> "#ast-src#it"
d = -> "#ast-dst#it"

{baseUrl} = require('./site.json')


parse ->


    @add-plugin 'jadeBeml',(g, deps) ->
        @compile-files( (-> "jade -O ./site.json -P -p #{it.orig-complete} < #{it.orig-complete} | beml-cli > #{it.build-target}"), ".html", g, deps )

    @notifyStrip ast-dst

    @serveRoot '.'

    @collect "build", -> [

        @collect "build-assets", -> [
                @notify ~>
                    @dest d("/css/client.css"), ->
                            @concatcss -> [
                                @less s("/less/main.less"), s("/less/*.less")
                                @copy s("/css/*.css")
                                ]

                @notify ~>
                    @toDir d("/img"), { strip: s("/img") },  -> [
                        @glob s("/img/*.png")
                        @glob s("/img/*.jpg")
                        ]

                @toDir d("/data"), { strip: s("/data") }, -> [
                    @glob s("/data/*.json")
                    ]

                @toDir d("/fonts"), { strip: s("/fonts") }, -> [
                    @glob s("/fonts/*.woff")
                    @glob s("/fonts/*.ttf")
                    ]

                @notify ~>
                    @toDir d(""), { strip: s("") }, -> [
                        @jadeBeml s("/index.jade")    , s("/layouts/base.jade")
                        @jadeBeml s("/teaching.jade") , s("/layouts/base.jade")
                        @jadeBeml s("/videos.jade")   , s("/layouts/base.jade")
                        @jadeBeml s("/address.jade")  , s("/layouts/base.jade")
                        ]


                @notify ~>
                    @dest d("/js/client.js"), ->
                            @concatjs -> [
                                @copy ("./bower_components/angular/angular.min.js")
                                @copy ("./bower_components/ng-table/ng-table.js")
                                @copy ("./bower_components/fastclick/lib/fastclick.js")
                                @copy ("./assets/vendor/highlight.min.js")
                                @browserify s("/js/client.ls"), s("/js/*.{ls,js}")
                            ]
                ]
        


        ]

    @collect "build-posts", -> [    
                @cmd "blog-cli md2json directory ./posts -d #name/data/posts -t ./assets/layouts/post.jade -c ./site.json"         
                ]

    @collect "derived", -> [
            @cmd "blog-cli json2html directory ./#name/data/posts -d ./#name"
            @cmd "blog-cli json2json  ./#name/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./#name/blog.html"
            @cmd "blog-cli json2json  ./#name/data/posts > ./#name/data/index.json"
            @cmd "blog-cli renderjson -f  ./#name/data/projects.json -t ./assets/projects.jade -c ./site.json > ./#name/projects.html"
            @cmd "json2html-biblio-cli -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./#name/research.html"
            @cmd "sitemap-cli generate -p http://www.vittoriozaccaria.net#baseUrl #name > #name/sitemap.xml"
            ]

        
    @collect "all", ->
        @command-seq -> [
            @make "build"
            @make "build-posts"
            @make "derived"
            ]

    @collect "deploy", -> 
        @command-seq -> [
            @make "all"
            @cmd "blog-ftp-cli -t -l #name -r #baseUrl"
            ]

    @collect "update", -> 
        @command-seq -> [
            @make "all"
            @cmd "blog-ftp-cli -l #name -r #baseUrl"
            ]

    @collect "deploy-lftp", ->
        @command-seq -> [
            @make "all"
            @cmd ""
            ]


    @collect "clean", -> [
        @remove-all-targets()
        @cmd "rm -rf #name"
    ]



        


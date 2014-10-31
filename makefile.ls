#!/usr/bin/env lsc 

{ parse, add-plugin } = require('newmake')

name = "_site"
ast-dst = "#name"
ast-src = "assets"

s = -> "#ast-src#it"
d = -> "#ast-dst#it"


parse ->


    @add-plugin 'jadeBeml',(g, deps) ->
        @compile-files( (-> "jade -O ./site.json -P -p #{it.orig-complete} < #{it.orig-complete} | beml-cli > #{it.build-target}"), ".html", g, deps )

    @add-plugin 'md2json', (g, deps) ->
        @compile-files( (-> "cat #{it.orig-complete} | json2html-cli md in -t ./assets/layouts/post.jade -c ./site.json > $@"), ".json", g, deps)

    @notifyStrip ast-dst

    # without leading backslashes
    @notifyRewrite "index.html", '**/*.html'

    @collect "build", -> [

        @collect "build-assets", -> [
                @notify ~>
                    @dest d("/css/client.css"), ->
                            @concatcss -> [
                                @less s("/less/main.less"), s("/less/*.less")
                                @copy s("/*.css")
                                ]

                @notify ~>
                    @toDir d("/img"), { strip: s("/img") },  -> [
                        @glob s("/img/*.png")
                        @glob s("/img/*.jpg")
                        ]

                @toDir d("/data"), { strip: s("/data") }, -> [
                    @glob s("/data/*.json")
                    ]


                @notify ~>
                    @toDir d(""), { strip: s("") }, -> 
                        @jadeBeml s("/index.jade"), s("/layouts/base.jade")


                @notify ~>
                    @dest d("/js/client.js"), ->
                        @concatjs -> [
                            @copy ("./bower_components/angular/angular.min.js")
                            @copy ("./bower_components/ng-table/ng-table.js")
                            @copy ("./bower_components/fastclick/lib/fastclick.js")
                            @browserify s("/js/client.ls"), s("/js/*.{ls,js}")
                        ]
                ]

        

        @collect "build-posts", -> [    
                    @cmd "json2html-cli markdown directory ./posts -d #name/data/posts -t ./assets/layouts/post.jade -c ./site.json"         
                    ]

        ]
        
    @collect "all", ->
        @command-seq -> [
            @make "build"
            @cmd "json2html-cli html directory ./#name/data/posts -d ./#name"
            ]



    @collect "clean", -> [
        @remove-all-targets()
    ]



        


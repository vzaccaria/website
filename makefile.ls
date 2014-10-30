#!/usr/bin/env livescript

{ parse, add-plugin } = require('newmake')

name = "_site2"
ast-dst = "#name"
ast-src = "assets"

s = -> "#ast-src#it"
d = -> "#ast-dst#it"


parse ->


    @add-plugin 'jadeBeml',(g, deps) ->
        @compile-files( (-> "jade -O ./site.json -P -p #{it.orig-complete} < #{it.orig-complete} | beml-cli > #{it.build-target}"), ".html", g, deps )

    @add-plugin 'md2json', (g, deps) ->
        @compile-files( (-> "cat #{it.orig-complete} | yaml-cli | json2html-cli json in -t ./assets/layouts/post.jade -c ./site.json > $@"), ".json", g, deps)

    @notifyStrip ast-dst

    # without leading backslashes
    @notifyRewrite "index.html", '**/*.html'

    @collect "all", -> [

        @collect "client", -> [
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
                    @toDir d("/data/posts"), { strip: ("posts") }, ->
                        @md2json ("posts/*.md"), s("/layouts/*.jade")              

                @notify ~>
                    @dest d("/js/client.js"), ->
                        @browserify s("/js/client.ls"), s("/js/*.{ls,js}")
                ]

        ]
        
    @collect "publish", ->
        @command-seq -> [
            @make "all"
            @cmd "json2html-cli dir #name/data/posts -d #name"
            ]



    @collect "clean", -> [
        @remove-all-targets()
    ]



        


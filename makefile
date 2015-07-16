.DEFAULT_GOAL := all

.build/0-favicon.png: assets/img/favicon.png
	cp assets/img/favicon.png .build/0-favicon.png

.build/1-fsm-express-project-image.png: assets/img/fsm-express-project-image.png
	cp assets/img/fsm-express-project-image.png .build/1-fsm-express-project-image.png

.build/2-webmake-image.png: assets/img/webmake-image.png
	cp assets/img/webmake-image.png .build/2-webmake-image.png

.build/3-chained-image.jpg: assets/img/chained-image.jpg
	cp assets/img/chained-image.jpg .build/3-chained-image.jpg

.build/4-dyn-css-image.jpg: assets/img/dyn-css-image.jpg
	cp assets/img/dyn-css-image.jpg .build/4-dyn-css-image.jpg

.build/5-exemd.jpg: assets/img/exemd.jpg
	cp assets/img/exemd.jpg .build/5-exemd.jpg

.build/6-fsm-express-project-image.jpg: assets/img/fsm-express-project-image.jpg
	cp assets/img/fsm-express-project-image.jpg .build/6-fsm-express-project-image.jpg

.build/7-profile_pic_1_res.jpg: assets/img/profile_pic_1_res.jpg
	cp assets/img/profile_pic_1_res.jpg .build/7-profile_pic_1_res.jpg

.build/8-sidebar_picture.jpg: assets/img/sidebar_picture.jpg
	cp assets/img/sidebar_picture.jpg .build/8-sidebar_picture.jpg

.build/9-sweet-angle-image.jpg: assets/img/sweet-angle-image.jpg
	cp assets/img/sweet-angle-image.jpg .build/9-sweet-angle-image.jpg

.build/10-webmake-image.jpg: assets/img/webmake-image.jpg
	cp assets/img/webmake-image.jpg .build/10-webmake-image.jpg

_site/img/favicon.png: .build/0-favicon.png
	@mkdir -p _site/img/
	cp .build/0-favicon.png $@

_site/img/fsm-express-project-image.png: .build/1-fsm-express-project-image.png
	@mkdir -p _site/img/
	cp .build/1-fsm-express-project-image.png $@

_site/img/webmake-image.png: .build/2-webmake-image.png
	@mkdir -p _site/img/
	cp .build/2-webmake-image.png $@

_site/img/chained-image.jpg: .build/3-chained-image.jpg
	@mkdir -p _site/img/
	cp .build/3-chained-image.jpg $@

_site/img/dyn-css-image.jpg: .build/4-dyn-css-image.jpg
	@mkdir -p _site/img/
	cp .build/4-dyn-css-image.jpg $@

_site/img/exemd.jpg: .build/5-exemd.jpg
	@mkdir -p _site/img/
	cp .build/5-exemd.jpg $@

_site/img/fsm-express-project-image.jpg: .build/6-fsm-express-project-image.jpg
	@mkdir -p _site/img/
	cp .build/6-fsm-express-project-image.jpg $@

_site/img/profile_pic_1_res.jpg: .build/7-profile_pic_1_res.jpg
	@mkdir -p _site/img/
	cp .build/7-profile_pic_1_res.jpg $@

_site/img/sidebar_picture.jpg: .build/8-sidebar_picture.jpg
	@mkdir -p _site/img/
	cp .build/8-sidebar_picture.jpg $@

_site/img/sweet-angle-image.jpg: .build/9-sweet-angle-image.jpg
	@mkdir -p _site/img/
	cp .build/9-sweet-angle-image.jpg $@

_site/img/webmake-image.jpg: .build/10-webmake-image.jpg
	@mkdir -p _site/img/
	cp .build/10-webmake-image.jpg $@

.build/11-biblio.json: assets/data/biblio.json
	cp assets/data/biblio.json .build/11-biblio.json

.build/12-projects.json: assets/data/projects.json
	cp assets/data/projects.json .build/12-projects.json

_site/data/biblio.json: .build/11-biblio.json
	@mkdir -p _site/data/
	cp .build/11-biblio.json $@

_site/data/projects.json: .build/12-projects.json
	@mkdir -p _site/data/
	cp .build/12-projects.json $@

.build/13-cv.pdf: deposit/cv.pdf
	cp deposit/cv.pdf .build/13-cv.pdf

_site/deposit/cv.pdf: .build/13-cv.pdf
	@mkdir -p _site/deposit/
	cp .build/13-cv.pdf $@

.build/14-fontawesome-webfont.woff: assets/fonts/fontawesome-webfont.woff
	cp assets/fonts/fontawesome-webfont.woff .build/14-fontawesome-webfont.woff

.build/15-fontawesome-webfont.ttf: assets/fonts/fontawesome-webfont.ttf
	cp assets/fonts/fontawesome-webfont.ttf .build/15-fontawesome-webfont.ttf

_site/fonts/fontawesome-webfont.woff: .build/14-fontawesome-webfont.woff
	@mkdir -p _site/fonts/
	cp .build/14-fontawesome-webfont.woff $@

_site/fonts/fontawesome-webfont.ttf: .build/15-fontawesome-webfont.ttf
	@mkdir -p _site/fonts/
	cp .build/15-fontawesome-webfont.ttf $@

.build/16-index.html: assets/layouts/base.jade assets/index.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/index.jade < assets/index.jade | beml-cli > .build/16-index.html

.build/17-teaching.html: assets/layouts/base.jade assets/teaching.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/teaching.jade < assets/teaching.jade | beml-cli > .build/17-teaching.html

.build/18-videos.html: assets/layouts/base.jade assets/videos.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/videos.jade < assets/videos.jade | beml-cli > .build/18-videos.html

.build/19-address.html: assets/layouts/base.jade assets/address.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/address.jade < assets/address.jade | beml-cli > .build/19-address.html

_site/index.html: .build/16-index.html
	@mkdir -p _site/
	cp .build/16-index.html $@

_site/teaching.html: .build/17-teaching.html
	@mkdir -p _site/
	cp .build/17-teaching.html $@

_site/videos.html: .build/18-videos.html
	@mkdir -p _site/
	cp .build/18-videos.html $@

_site/address.html: .build/19-address.html
	@mkdir -p _site/
	cp .build/19-address.html $@

.build/21-angular.min.js: ./bower_components/angular/angular.min.js
	cp bower_components/angular/angular.min.js .build/21-angular.min.js

.build/22-ng-table.js: ./bower_components/ng-table/ng-table.js
	cp bower_components/ng-table/ng-table.js .build/22-ng-table.js

.build/23-fastclick.js: ./bower_components/fastclick/lib/fastclick.js
	cp bower_components/fastclick/lib/fastclick.js .build/23-fastclick.js

.build/24-client.js: assets/css/fonts.css assets/css/obsidian.css assets/js/bundle.js assets/js/calendar.ls assets/js/client.ls assets/js/easyDirective.ls assets/js/entry.ls assets/less/bio.less assets/less/calendar.less assets/less/main.less assets/less/mixin.less assets/less/post.less assets/less/posts.less assets/less/projects.less assets/less/publications.less assets/less/research.less assets/less/reset.less assets/less/segment.less assets/less/sidebar.less assets/less/table.less assets/less/teaching.less assets/less/videos.less assets/vendor/dyncss.js assets/vendor/highlight.min.js
	./node_modules/.bin/browserify -t node-lessify -t liveify assets/js/client.ls -o .build/24-client.js

.build/25-bundle.js: assets/img/chained-image.jpg assets/img/dyn-css-image.jpg assets/img/exemd.jpg assets/img/fsm-express-project-image.jpg assets/img/profile_pic_1_res.jpg assets/img/sidebar_picture.jpg assets/img/sweet-angle-image.jpg assets/img/webmake-image.jpg assets/js/bundle.js
	< assets/js/bundle.js ./node_modules/.bin/brfs - > .build/25-bundle.js

.build/concat-tmp20.js: .build/21-angular.min.js .build/22-ng-table.js .build/23-fastclick.js .build/24-client.js .build/25-bundle.js
	cat $^ > $@

.build/26-concat-tmp20.min.js: .build/concat-tmp20.js
	uglifyjs .build/concat-tmp20.js -c -m  > $@

_site/js: 
	mkdir -p _site/js

_site/js/client.js: .build/26-concat-tmp20.min.js _site/js
	cp .build/26-concat-tmp20.min.js $@

.PHONY : build-assets
build-assets: _site/img/favicon.png _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg _site/data/biblio.json _site/data/projects.json _site/deposit/cv.pdf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf _site/index.html _site/teaching.html _site/videos.html _site/address.html _site/js/client.js

.PHONY : build
build: build-assets

.PHONY : cmd-27
cmd-27: 
	./node_modules/.bin/blog-cli md2json directory ./posts -d _site/data/posts -t ./assets/layouts/post.jade -c ./site.json

.PHONY : build-posts
build-posts: cmd-27

.PHONY : cmd-28
cmd-28: 
	./node_modules/.bin/blog-cli json2html directory ./_site/data/posts -d ./_site

.PHONY : cmd-29
cmd-29: 
	./node_modules/.bin/blog-cli json2json  ./_site/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./_site/blog.html

.PHONY : cmd-30
cmd-30: 
	./node_modules/.bin/blog-cli json2json  ./_site/data/posts > ./_site/data/index.json

.PHONY : cmd-31
cmd-31: 
	./node_modules/.bin/blog-cli renderjson -f  ./_site/data/projects.json -t ./assets/projects.jade -c ./site.json > ./_site/projects.html

.PHONY : cmd-32
cmd-32: 
	./node_modules/.bin/json2html-biblio -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./_site/research.html

.PHONY : cmd-33
cmd-33: 
	./node_modules/.bin/sitemap-cli generate -p http://www.vittoriozaccaria.net _site > _site/sitemap.xml

.PHONY : derived
derived: cmd-28 cmd-29 cmd-30 cmd-31 cmd-32 cmd-33

.PHONY : cmd-34
cmd-34: 
	./node_modules/.bin/serve _site -p 4000

.PHONY : serve
serve: cmd-34

.PHONY : cmd-35
cmd-35: 
	make build

.PHONY : cmd-36
cmd-36: 
	make build-posts

.PHONY : cmd-37
cmd-37: 
	make derived

.PHONY : cmd-seq-38
cmd-seq-38: 
	make cmd-35
	make cmd-36
	make cmd-37

.PHONY : all
all: cmd-seq-38

.PHONY : clean-39
clean-39: 
	rm -rf .build/0-favicon.png .build/1-fsm-express-project-image.png .build/2-webmake-image.png .build/3-chained-image.jpg .build/4-dyn-css-image.jpg .build/5-exemd.jpg .build/6-fsm-express-project-image.jpg .build/7-profile_pic_1_res.jpg .build/8-sidebar_picture.jpg .build/9-sweet-angle-image.jpg .build/10-webmake-image.jpg _site/img/favicon.png _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg .build/11-biblio.json .build/12-projects.json _site/data/biblio.json _site/data/projects.json .build/13-cv.pdf _site/deposit/cv.pdf .build/14-fontawesome-webfont.woff .build/15-fontawesome-webfont.ttf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf .build/16-index.html .build/17-teaching.html .build/18-videos.html .build/19-address.html _site/index.html _site/teaching.html _site/videos.html _site/address.html .build/21-angular.min.js .build/22-ng-table.js .build/23-fastclick.js .build/24-client.js .build/25-bundle.js .build/concat-tmp20.js .build/26-concat-tmp20.min.js _site/js _site/js/client.js

.PHONY : clean-40
clean-40: 
	rm -rf .build

.PHONY : clean-41
clean-41: 
	mkdir -p .build

.PHONY : cmd-42
cmd-42: 
	rm -rf _site/*

.PHONY : clean
clean: clean-39 clean-40 clean-41 cmd-42

.DEFAULT_GOAL := all

.build/0-fsm-express-project-image.png: assets/img/fsm-express-project-image.png
	cp assets/img/fsm-express-project-image.png .build/0-fsm-express-project-image.png

.build/1-webmake-image.png: assets/img/webmake-image.png
	cp assets/img/webmake-image.png .build/1-webmake-image.png

.build/2-chained-image.jpg: assets/img/chained-image.jpg
	cp assets/img/chained-image.jpg .build/2-chained-image.jpg

.build/3-dyn-css-image.jpg: assets/img/dyn-css-image.jpg
	cp assets/img/dyn-css-image.jpg .build/3-dyn-css-image.jpg

.build/4-exemd.jpg: assets/img/exemd.jpg
	cp assets/img/exemd.jpg .build/4-exemd.jpg

.build/5-fsm-express-project-image.jpg: assets/img/fsm-express-project-image.jpg
	cp assets/img/fsm-express-project-image.jpg .build/5-fsm-express-project-image.jpg

.build/6-profile_pic_1_res.jpg: assets/img/profile_pic_1_res.jpg
	cp assets/img/profile_pic_1_res.jpg .build/6-profile_pic_1_res.jpg

.build/7-sidebar_picture.jpg: assets/img/sidebar_picture.jpg
	cp assets/img/sidebar_picture.jpg .build/7-sidebar_picture.jpg

.build/8-sweet-angle-image.jpg: assets/img/sweet-angle-image.jpg
	cp assets/img/sweet-angle-image.jpg .build/8-sweet-angle-image.jpg

.build/9-webmake-image.jpg: assets/img/webmake-image.jpg
	cp assets/img/webmake-image.jpg .build/9-webmake-image.jpg

_site/img/fsm-express-project-image.png: .build/0-fsm-express-project-image.png
	@mkdir -p _site/img/
	cp .build/0-fsm-express-project-image.png $@

_site/img/webmake-image.png: .build/1-webmake-image.png
	@mkdir -p _site/img/
	cp .build/1-webmake-image.png $@

_site/img/chained-image.jpg: .build/2-chained-image.jpg
	@mkdir -p _site/img/
	cp .build/2-chained-image.jpg $@

_site/img/dyn-css-image.jpg: .build/3-dyn-css-image.jpg
	@mkdir -p _site/img/
	cp .build/3-dyn-css-image.jpg $@

_site/img/exemd.jpg: .build/4-exemd.jpg
	@mkdir -p _site/img/
	cp .build/4-exemd.jpg $@

_site/img/fsm-express-project-image.jpg: .build/5-fsm-express-project-image.jpg
	@mkdir -p _site/img/
	cp .build/5-fsm-express-project-image.jpg $@

_site/img/profile_pic_1_res.jpg: .build/6-profile_pic_1_res.jpg
	@mkdir -p _site/img/
	cp .build/6-profile_pic_1_res.jpg $@

_site/img/sidebar_picture.jpg: .build/7-sidebar_picture.jpg
	@mkdir -p _site/img/
	cp .build/7-sidebar_picture.jpg $@

_site/img/sweet-angle-image.jpg: .build/8-sweet-angle-image.jpg
	@mkdir -p _site/img/
	cp .build/8-sweet-angle-image.jpg $@

_site/img/webmake-image.jpg: .build/9-webmake-image.jpg
	@mkdir -p _site/img/
	cp .build/9-webmake-image.jpg $@

.build/10-biblio.json: assets/data/biblio.json
	cp assets/data/biblio.json .build/10-biblio.json

.build/11-projects.json: assets/data/projects.json
	cp assets/data/projects.json .build/11-projects.json

_site/data/biblio.json: .build/10-biblio.json
	@mkdir -p _site/data/
	cp .build/10-biblio.json $@

_site/data/projects.json: .build/11-projects.json
	@mkdir -p _site/data/
	cp .build/11-projects.json $@

.build/12-cv.pdf: deposit/cv.pdf
	cp deposit/cv.pdf .build/12-cv.pdf

_site/deposit/cv.pdf: .build/12-cv.pdf
	@mkdir -p _site/deposit/
	cp .build/12-cv.pdf $@

.build/13-fontawesome-webfont.woff: assets/fonts/fontawesome-webfont.woff
	cp assets/fonts/fontawesome-webfont.woff .build/13-fontawesome-webfont.woff

.build/14-fontawesome-webfont.ttf: assets/fonts/fontawesome-webfont.ttf
	cp assets/fonts/fontawesome-webfont.ttf .build/14-fontawesome-webfont.ttf

_site/fonts/fontawesome-webfont.woff: .build/13-fontawesome-webfont.woff
	@mkdir -p _site/fonts/
	cp .build/13-fontawesome-webfont.woff $@

_site/fonts/fontawesome-webfont.ttf: .build/14-fontawesome-webfont.ttf
	@mkdir -p _site/fonts/
	cp .build/14-fontawesome-webfont.ttf $@

.build/15-index.html: assets/layouts/base.jade assets/index.jade
	jade -O ./site.json -P -p assets/index.jade < assets/index.jade | beml-cli > .build/15-index.html

.build/16-teaching.html: assets/layouts/base.jade assets/teaching.jade
	jade -O ./site.json -P -p assets/teaching.jade < assets/teaching.jade | beml-cli > .build/16-teaching.html

.build/17-videos.html: assets/layouts/base.jade assets/videos.jade
	jade -O ./site.json -P -p assets/videos.jade < assets/videos.jade | beml-cli > .build/17-videos.html

.build/18-address.html: assets/layouts/base.jade assets/address.jade
	jade -O ./site.json -P -p assets/address.jade < assets/address.jade | beml-cli > .build/18-address.html

_site/index.html: .build/15-index.html
	@mkdir -p _site/
	cp .build/15-index.html $@

_site/teaching.html: .build/16-teaching.html
	@mkdir -p _site/
	cp .build/16-teaching.html $@

_site/videos.html: .build/17-videos.html
	@mkdir -p _site/
	cp .build/17-videos.html $@

_site/address.html: .build/18-address.html
	@mkdir -p _site/
	cp .build/18-address.html $@

.build/20-angular.min.js: ./bower_components/angular/angular.min.js
	cp bower_components/angular/angular.min.js .build/20-angular.min.js

.build/21-ng-table.js: ./bower_components/ng-table/ng-table.js
	cp bower_components/ng-table/ng-table.js .build/21-ng-table.js

.build/22-fastclick.js: ./bower_components/fastclick/lib/fastclick.js
	cp bower_components/fastclick/lib/fastclick.js .build/22-fastclick.js

.build/23-client.js: assets/css/fonts.css assets/css/obsidian.css assets/js/bundle.js assets/js/calendar.ls assets/js/client.ls assets/js/easyDirective.ls assets/js/entry.ls assets/less/bio.less assets/less/calendar.less assets/less/main.less assets/less/mixin.less assets/less/post.less assets/less/posts.less assets/less/projects.less assets/less/publications.less assets/less/research.less assets/less/reset.less assets/less/segment.less assets/less/sidebar.less assets/less/table.less assets/less/teaching.less assets/less/videos.less assets/vendor/dyncss.js assets/vendor/highlight.min.js
	browserify -t node-lessify -t liveify assets/js/client.ls -o .build/23-client.js

.build/24-bundle.js: assets/img/chained-image.jpg assets/img/dyn-css-image.jpg assets/img/exemd.jpg assets/img/fsm-express-project-image.jpg assets/img/profile_pic_1_res.jpg assets/img/sidebar_picture.jpg assets/img/sweet-angle-image.jpg assets/img/webmake-image.jpg assets/js/bundle.js
	< assets/js/bundle.js ./node_modules/.bin/brfs - > .build/24-bundle.js

.build/concat-tmp19.js: .build/20-angular.min.js .build/21-ng-table.js .build/22-fastclick.js .build/23-client.js .build/24-bundle.js
	cat $^ > $@

.build/25-concat-tmp19.min.js: .build/concat-tmp19.js
	uglifyjs .build/concat-tmp19.js -c -m  > $@

_site/js: 
	mkdir -p _site/js

_site/js/client.js: .build/25-concat-tmp19.min.js _site/js
	cp .build/25-concat-tmp19.min.js $@

.PHONY : build-assets
build-assets: _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg _site/data/biblio.json _site/data/projects.json _site/deposit/cv.pdf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf _site/index.html _site/teaching.html _site/videos.html _site/address.html _site/js/client.js

.PHONY : build
build: build-assets

.PHONY : cmd-26
cmd-26: 
	blog-cli md2json directory ./posts -d _site/data/posts -t ./assets/layouts/post.jade -c ./site.json

.PHONY : build-posts
build-posts: cmd-26

.PHONY : cmd-27
cmd-27: 
	blog-cli json2html directory ./_site/data/posts -d ./_site

.PHONY : cmd-28
cmd-28: 
	blog-cli json2json  ./_site/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./_site/blog.html

.PHONY : cmd-29
cmd-29: 
	blog-cli json2json  ./_site/data/posts > ./_site/data/index.json

.PHONY : cmd-30
cmd-30: 
	blog-cli renderjson -f  ./_site/data/projects.json -t ./assets/projects.jade -c ./site.json > ./_site/projects.html

.PHONY : cmd-31
cmd-31: 
	json2html-biblio-cli -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./_site/research.html

.PHONY : cmd-32
cmd-32: 
	sitemap-cli generate -p http://www.vittoriozaccaria.net _site > _site/sitemap.xml

.PHONY : derived
derived: cmd-27 cmd-28 cmd-29 cmd-30 cmd-31 cmd-32

.PHONY : cmd-33
cmd-33: 
	make build

.PHONY : cmd-34
cmd-34: 
	make build-posts

.PHONY : cmd-35
cmd-35: 
	make derived

.PHONY : cmd-seq-36
cmd-seq-36: 
	make cmd-33
	make cmd-34
	make cmd-35

.PHONY : all
all: cmd-seq-36

.PHONY : cmd-37
cmd-37: 
	make all

.PHONY : cmd-38
cmd-38: 
	blog-ftp-cli -t -l _site -r 

.PHONY : cmd-seq-39
cmd-seq-39: 
	make cmd-37
	make cmd-38

.PHONY : deploy
deploy: cmd-seq-39

.PHONY : cmd-40
cmd-40: 
	make all

.PHONY : cmd-41
cmd-41: 
	blog-ftp-cli -l _site -r 

.PHONY : cmd-seq-42
cmd-seq-42: 
	make cmd-40
	make cmd-41

.PHONY : update
update: cmd-seq-42

.PHONY : cmd-43
cmd-43: 
	make all

.PHONY : cmd-44
cmd-44: 
	

.PHONY : cmd-seq-45
cmd-seq-45: 
	make cmd-43
	make cmd-44

.PHONY : deploy-lftp
deploy-lftp: cmd-seq-45

.PHONY : clean-46
clean-46: 
	rm -rf .build/0-fsm-express-project-image.png .build/1-webmake-image.png .build/2-chained-image.jpg .build/3-dyn-css-image.jpg .build/4-exemd.jpg .build/5-fsm-express-project-image.jpg .build/6-profile_pic_1_res.jpg .build/7-sidebar_picture.jpg .build/8-sweet-angle-image.jpg .build/9-webmake-image.jpg _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg .build/10-biblio.json .build/11-projects.json _site/data/biblio.json _site/data/projects.json .build/12-cv.pdf _site/deposit/cv.pdf .build/13-fontawesome-webfont.woff .build/14-fontawesome-webfont.ttf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf .build/15-index.html .build/16-teaching.html .build/17-videos.html .build/18-address.html _site/index.html _site/teaching.html _site/videos.html _site/address.html .build/20-angular.min.js .build/21-ng-table.js .build/22-fastclick.js .build/23-client.js .build/24-bundle.js .build/concat-tmp19.js .build/25-concat-tmp19.min.js _site/js _site/js/client.js

.PHONY : clean-47
clean-47: 
	rm -rf .build

.PHONY : clean-48
clean-48: 
	mkdir -p .build

.PHONY : cmd-49
cmd-49: 
	rm -rf _site/*

.PHONY : clean
clean: clean-46 clean-47 clean-48 cmd-49

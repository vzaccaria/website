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

.build/12-fontawesome-webfont.woff: assets/fonts/fontawesome-webfont.woff
	cp assets/fonts/fontawesome-webfont.woff .build/12-fontawesome-webfont.woff

.build/13-fontawesome-webfont.ttf: assets/fonts/fontawesome-webfont.ttf
	cp assets/fonts/fontawesome-webfont.ttf .build/13-fontawesome-webfont.ttf

_site/fonts/fontawesome-webfont.woff: .build/12-fontawesome-webfont.woff
	@mkdir -p _site/fonts/
	cp .build/12-fontawesome-webfont.woff $@

_site/fonts/fontawesome-webfont.ttf: .build/13-fontawesome-webfont.ttf
	@mkdir -p _site/fonts/
	cp .build/13-fontawesome-webfont.ttf $@

.build/14-index.html: assets/layouts/base.jade assets/index.jade
	jade -O ./site.json -P -p assets/index.jade < assets/index.jade | beml-cli > .build/14-index.html

.build/15-teaching.html: assets/layouts/base.jade assets/teaching.jade
	jade -O ./site.json -P -p assets/teaching.jade < assets/teaching.jade | beml-cli > .build/15-teaching.html

.build/16-videos.html: assets/layouts/base.jade assets/videos.jade
	jade -O ./site.json -P -p assets/videos.jade < assets/videos.jade | beml-cli > .build/16-videos.html

.build/17-address.html: assets/layouts/base.jade assets/address.jade
	jade -O ./site.json -P -p assets/address.jade < assets/address.jade | beml-cli > .build/17-address.html

_site/index.html: .build/14-index.html
	@mkdir -p _site/
	cp .build/14-index.html $@

_site/teaching.html: .build/15-teaching.html
	@mkdir -p _site/
	cp .build/15-teaching.html $@

_site/videos.html: .build/16-videos.html
	@mkdir -p _site/
	cp .build/16-videos.html $@

_site/address.html: .build/17-address.html
	@mkdir -p _site/
	cp .build/17-address.html $@

.build/19-angular.min.js: ./bower_components/angular/angular.min.js
	cp bower_components/angular/angular.min.js .build/19-angular.min.js

.build/20-ng-table.js: ./bower_components/ng-table/ng-table.js
	cp bower_components/ng-table/ng-table.js .build/20-ng-table.js

.build/21-fastclick.js: ./bower_components/fastclick/lib/fastclick.js
	cp bower_components/fastclick/lib/fastclick.js .build/21-fastclick.js

.build/22-client.js: assets/css/fonts.css assets/css/obsidian.css assets/js/bundle.js assets/js/calendar.ls assets/js/client.ls assets/js/easyDirective.ls assets/js/entry.ls assets/less/bio.less assets/less/calendar.less assets/less/main.less assets/less/mixin.less assets/less/post.less assets/less/posts.less assets/less/projects.less assets/less/publications.less assets/less/research.less assets/less/reset.less assets/less/segment.less assets/less/sidebar.less assets/less/table.less assets/less/teaching.less assets/less/videos.less assets/vendor/dyncss.js assets/vendor/highlight.min.js
	browserify -t node-lessify -t liveify assets/js/client.ls -o .build/22-client.js

.build/23-bundle.js: assets/img/chained-image.jpg assets/img/dyn-css-image.jpg assets/img/exemd.jpg assets/img/fsm-express-project-image.jpg assets/img/profile_pic_1_res.jpg assets/img/sidebar_picture.jpg assets/img/sweet-angle-image.jpg assets/img/webmake-image.jpg assets/js/bundle.js
	< assets/js/bundle.js ./node_modules/.bin/brfs - > .build/23-bundle.js

.build/concat-tmp18.js: .build/19-angular.min.js .build/20-ng-table.js .build/21-fastclick.js .build/22-client.js .build/23-bundle.js
	cat $^ > $@

.build/24-concat-tmp18.min.js: .build/concat-tmp18.js
	uglifyjs .build/concat-tmp18.js -c -m  > $@

_site/js: 
	mkdir -p _site/js

_site/js/client.js: .build/24-concat-tmp18.min.js _site/js
	cp .build/24-concat-tmp18.min.js $@

.PHONY : build-assets
build-assets: _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg _site/data/biblio.json _site/data/projects.json _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf _site/index.html _site/teaching.html _site/videos.html _site/address.html _site/js/client.js

.PHONY : build
build: build-assets

.PHONY : cmd-25
cmd-25: 
	blog-cli md2json directory ./posts -d _site/data/posts -t ./assets/layouts/post.jade -c ./site.json

.PHONY : build-posts
build-posts: cmd-25

.PHONY : cmd-26
cmd-26: 
	blog-cli json2html directory ./_site/data/posts -d ./_site

.PHONY : cmd-27
cmd-27: 
	blog-cli json2json  ./_site/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./_site/blog.html

.PHONY : cmd-28
cmd-28: 
	blog-cli json2json  ./_site/data/posts > ./_site/data/index.json

.PHONY : cmd-29
cmd-29: 
	blog-cli renderjson -f  ./_site/data/projects.json -t ./assets/projects.jade -c ./site.json > ./_site/projects.html

.PHONY : cmd-30
cmd-30: 
	json2html-biblio-cli -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./_site/research.html

.PHONY : cmd-31
cmd-31: 
	sitemap-cli generate -p http://www.vittoriozaccaria.net/v2 _site > _site/sitemap.xml

.PHONY : derived
derived: cmd-26 cmd-27 cmd-28 cmd-29 cmd-30 cmd-31

.PHONY : cmd-32
cmd-32: 
	make build

.PHONY : cmd-33
cmd-33: 
	make build-posts

.PHONY : cmd-34
cmd-34: 
	make derived

.PHONY : cmd-seq-35
cmd-seq-35: 
	make cmd-32
	make cmd-33
	make cmd-34

.PHONY : all
all: cmd-seq-35

.PHONY : cmd-36
cmd-36: 
	make all

.PHONY : cmd-37
cmd-37: 
	blog-ftp-cli -t -l _site -r /v2

.PHONY : cmd-seq-38
cmd-seq-38: 
	make cmd-36
	make cmd-37

.PHONY : deploy
deploy: cmd-seq-38

.PHONY : cmd-39
cmd-39: 
	make all

.PHONY : cmd-40
cmd-40: 
	blog-ftp-cli -l _site -r /v2

.PHONY : cmd-seq-41
cmd-seq-41: 
	make cmd-39
	make cmd-40

.PHONY : update
update: cmd-seq-41

.PHONY : cmd-42
cmd-42: 
	make all

.PHONY : cmd-43
cmd-43: 
	

.PHONY : cmd-seq-44
cmd-seq-44: 
	make cmd-42
	make cmd-43

.PHONY : deploy-lftp
deploy-lftp: cmd-seq-44

.PHONY : clean-45
clean-45: 
	rm -rf .build/0-fsm-express-project-image.png .build/1-webmake-image.png .build/2-chained-image.jpg .build/3-dyn-css-image.jpg .build/4-exemd.jpg .build/5-fsm-express-project-image.jpg .build/6-profile_pic_1_res.jpg .build/7-sidebar_picture.jpg .build/8-sweet-angle-image.jpg .build/9-webmake-image.jpg _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg .build/10-biblio.json .build/11-projects.json _site/data/biblio.json _site/data/projects.json .build/12-fontawesome-webfont.woff .build/13-fontawesome-webfont.ttf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf .build/14-index.html .build/15-teaching.html .build/16-videos.html .build/17-address.html _site/index.html _site/teaching.html _site/videos.html _site/address.html .build/19-angular.min.js .build/20-ng-table.js .build/21-fastclick.js .build/22-client.js .build/23-bundle.js .build/concat-tmp18.js .build/24-concat-tmp18.min.js _site/js _site/js/client.js

.PHONY : clean-46
clean-46: 
	rm -rf .build

.PHONY : clean-47
clean-47: 
	mkdir -p .build

.PHONY : cmd-48
cmd-48: 
	rm -rf _site

.PHONY : clean
clean: clean-45 clean-46 clean-47 cmd-48

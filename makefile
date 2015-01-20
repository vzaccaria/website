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

.build/10-projects.json: assets/data/projects.json
	cp assets/data/projects.json .build/10-projects.json

_site/data/projects.json: .build/10-projects.json
	@mkdir -p _site/data/
	cp .build/10-projects.json $@

.build/11-fontawesome-webfont.woff: assets/fonts/fontawesome-webfont.woff
	cp assets/fonts/fontawesome-webfont.woff .build/11-fontawesome-webfont.woff

.build/12-fontawesome-webfont.ttf: assets/fonts/fontawesome-webfont.ttf
	cp assets/fonts/fontawesome-webfont.ttf .build/12-fontawesome-webfont.ttf

_site/fonts/fontawesome-webfont.woff: .build/11-fontawesome-webfont.woff
	@mkdir -p _site/fonts/
	cp .build/11-fontawesome-webfont.woff $@

_site/fonts/fontawesome-webfont.ttf: .build/12-fontawesome-webfont.ttf
	@mkdir -p _site/fonts/
	cp .build/12-fontawesome-webfont.ttf $@

.build/13-index.html: assets/layouts/base.jade assets/index.jade
	jade -O ./site.json -P -p assets/index.jade < assets/index.jade | beml-cli > .build/13-index.html

.build/14-teaching.html: assets/layouts/base.jade assets/teaching.jade
	jade -O ./site.json -P -p assets/teaching.jade < assets/teaching.jade | beml-cli > .build/14-teaching.html

.build/15-videos.html: assets/layouts/base.jade assets/videos.jade
	jade -O ./site.json -P -p assets/videos.jade < assets/videos.jade | beml-cli > .build/15-videos.html

.build/16-address.html: assets/layouts/base.jade assets/address.jade
	jade -O ./site.json -P -p assets/address.jade < assets/address.jade | beml-cli > .build/16-address.html

_site/index.html: .build/13-index.html
	@mkdir -p _site/
	cp .build/13-index.html $@

_site/teaching.html: .build/14-teaching.html
	@mkdir -p _site/
	cp .build/14-teaching.html $@

_site/videos.html: .build/15-videos.html
	@mkdir -p _site/
	cp .build/15-videos.html $@

_site/address.html: .build/16-address.html
	@mkdir -p _site/
	cp .build/16-address.html $@

.build/18-angular.min.js: ./bower_components/angular/angular.min.js
	cp bower_components/angular/angular.min.js .build/18-angular.min.js

.build/19-ng-table.js: ./bower_components/ng-table/ng-table.js
	cp bower_components/ng-table/ng-table.js .build/19-ng-table.js

.build/20-fastclick.js: ./bower_components/fastclick/lib/fastclick.js
	cp bower_components/fastclick/lib/fastclick.js .build/20-fastclick.js

.build/21-client.js: assets/css/fonts.css assets/css/obsidian.css assets/js/bundle.js assets/js/calendar.ls assets/js/client.ls assets/js/easyDirective.ls assets/js/entry.ls assets/less/bio.less assets/less/calendar.less assets/less/main.less assets/less/mixin.less assets/less/post.less assets/less/posts.less assets/less/projects.less assets/less/publications.less assets/less/research.less assets/less/reset.less assets/less/segment.less assets/less/sidebar.less assets/less/table.less assets/less/teaching.less assets/less/videos.less assets/vendor/dyncss.js assets/vendor/highlight.min.js
	browserify -t node-lessify -t liveify assets/js/client.ls -o .build/21-client.js

.build/22-bundle.js: assets/img/chained-image.jpg assets/img/dyn-css-image.jpg assets/img/exemd.jpg assets/img/fsm-express-project-image.jpg assets/img/profile_pic_1_res.jpg assets/img/sidebar_picture.jpg assets/img/sweet-angle-image.jpg assets/img/webmake-image.jpg assets/js/bundle.js
	< assets/js/bundle.js ./node_modules/.bin/brfs - > .build/22-bundle.js

.build/concat-tmp17.js: .build/18-angular.min.js .build/19-ng-table.js .build/20-fastclick.js .build/21-client.js .build/22-bundle.js
	cat $^ > $@

.build/23-concat-tmp17.min.js: .build/concat-tmp17.js
	uglifyjs .build/concat-tmp17.js -c -m  > $@

_site/js: 
	mkdir -p _site/js

_site/js/client.js: .build/23-concat-tmp17.min.js _site/js
	cp .build/23-concat-tmp17.min.js $@

.PHONY : build-assets
build-assets: _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg _site/data/projects.json _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf _site/index.html _site/teaching.html _site/videos.html _site/address.html _site/js/client.js

.PHONY : build
build: build-assets

.PHONY : cmd-24
cmd-24: 
	blog-cli md2json directory ./posts -d _site/data/posts -t ./assets/layouts/post.jade -c ./site.json

.PHONY : build-posts
build-posts: cmd-24

.PHONY : cmd-25
cmd-25: 
	blog-cli json2html directory ./_site/data/posts -d ./_site

.PHONY : cmd-26
cmd-26: 
	blog-cli json2json  ./_site/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./_site/blog.html

.PHONY : cmd-27
cmd-27: 
	blog-cli json2json  ./_site/data/posts > ./_site/data/index.json

.PHONY : cmd-28
cmd-28: 
	blog-cli renderjson -f  ./_site/data/projects.json -t ./assets/projects.jade -c ./site.json > ./_site/projects.html

.PHONY : cmd-29
cmd-29: 
	json2html-biblio-cli -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./_site/research.html

.PHONY : cmd-30
cmd-30: 
	sitemap-cli generate -p http://www.vittoriozaccaria.net/v2 _site > _site/sitemap.xml

.PHONY : derived
derived: cmd-25 cmd-26 cmd-27 cmd-28 cmd-29 cmd-30

.PHONY : cmd-31
cmd-31: 
	make build

.PHONY : cmd-32
cmd-32: 
	make build-posts

.PHONY : cmd-33
cmd-33: 
	make derived

.PHONY : cmd-seq-34
cmd-seq-34: 
	make cmd-31
	make cmd-32
	make cmd-33

.PHONY : all
all: cmd-seq-34

.PHONY : cmd-35
cmd-35: 
	make all

.PHONY : cmd-36
cmd-36: 
	blog-ftp-cli -t -l _site -r /v2

.PHONY : cmd-seq-37
cmd-seq-37: 
	make cmd-35
	make cmd-36

.PHONY : deploy
deploy: cmd-seq-37

.PHONY : cmd-38
cmd-38: 
	make all

.PHONY : cmd-39
cmd-39: 
	blog-ftp-cli -l _site -r /v2

.PHONY : cmd-seq-40
cmd-seq-40: 
	make cmd-38
	make cmd-39

.PHONY : update
update: cmd-seq-40

.PHONY : cmd-41
cmd-41: 
	make all

.PHONY : cmd-42
cmd-42: 
	

.PHONY : cmd-seq-43
cmd-seq-43: 
	make cmd-41
	make cmd-42

.PHONY : deploy-lftp
deploy-lftp: cmd-seq-43

.PHONY : clean-44
clean-44: 
	rm -rf .build/0-fsm-express-project-image.png .build/1-webmake-image.png .build/2-chained-image.jpg .build/3-dyn-css-image.jpg .build/4-exemd.jpg .build/5-fsm-express-project-image.jpg .build/6-profile_pic_1_res.jpg .build/7-sidebar_picture.jpg .build/8-sweet-angle-image.jpg .build/9-webmake-image.jpg _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg .build/10-projects.json _site/data/projects.json .build/11-fontawesome-webfont.woff .build/12-fontawesome-webfont.ttf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf .build/13-index.html .build/14-teaching.html .build/15-videos.html .build/16-address.html _site/index.html _site/teaching.html _site/videos.html _site/address.html .build/18-angular.min.js .build/19-ng-table.js .build/20-fastclick.js .build/21-client.js .build/22-bundle.js .build/concat-tmp17.js .build/23-concat-tmp17.min.js _site/js _site/js/client.js

.PHONY : clean-45
clean-45: 
	rm -rf .build

.PHONY : clean-46
clean-46: 
	mkdir -p .build

.PHONY : cmd-47
cmd-47: 
	rm -rf _site

.PHONY : clean
clean: clean-44 clean-45 clean-46 cmd-47

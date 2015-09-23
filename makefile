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

.build/13-Alto.png: deposit/Alto.png
	cp deposit/Alto.png .build/13-Alto.png

.build/14-background.jpg: deposit/background.jpg
	cp deposit/background.jpg .build/14-background.jpg

.build/15-chevron.png: deposit/chevron.png
	cp deposit/chevron.png .build/15-chevron.png

.build/16-code.org.link.png: deposit/code.org.link.png
	cp deposit/code.org.link.png .build/16-code.org.link.png

.build/17-cv.pdf: deposit/cv.pdf
	cp deposit/cv.pdf .build/17-cv.pdf

.build/18-figure1.png: deposit/figure1.png
	cp deposit/figure1.png .build/18-figure1.png

.build/19-fsm-express-project-image.png: deposit/fsm-express-project-image.png
	cp deposit/fsm-express-project-image.png .build/19-fsm-express-project-image.png

.build/20-fulfilled.png: deposit/fulfilled.png
	cp deposit/fulfilled.png .build/20-fulfilled.png

.build/21-fulfilled1.png: deposit/fulfilled1.png
	cp deposit/fulfilled1.png .build/21-fulfilled1.png

.build/22-hipeac_presentation.png: deposit/hipeac_presentation.png
	cp deposit/hipeac_presentation.png .build/22-hipeac_presentation.png

.build/23-ieee-754.png: deposit/ieee-754.png
	cp deposit/ieee-754.png .build/23-ieee-754.png

.build/24-IMG_0097.JPG: deposit/IMG_0097.JPG
	cp deposit/IMG_0097.JPG .build/24-IMG_0097.JPG

.build/25-IMG_9201.JPG: deposit/IMG_9201.JPG
	cp deposit/IMG_9201.JPG .build/25-IMG_9201.JPG

.build/26-img-dyncss.jpg: deposit/img-dyncss.jpg
	cp deposit/img-dyncss.jpg .build/26-img-dyncss.jpg

.build/27-infographics_workshop_correlations.png: deposit/infographics_workshop_correlations.png
	cp deposit/infographics_workshop_correlations.png .build/27-infographics_workshop_correlations.png

.build/28-lambda.png: deposit/lambda.png
	cp deposit/lambda.png .build/28-lambda.png

.build/29-landing.png: deposit/landing.png
	cp deposit/landing.png .build/29-landing.png

.build/30-makingofsc.001.png: deposit/makingofsc.001.png
	cp deposit/makingofsc.001.png .build/30-makingofsc.001.png

.build/31-not-bad.jpg: deposit/not-bad.jpg
	cp deposit/not-bad.jpg .build/31-not-bad.jpg

.build/32-opencl-device-query.png: deposit/opencl-device-query.png
	cp deposit/opencl-device-query.png .build/32-opencl-device-query.png

.build/33-pending.png: deposit/pending.png
	cp deposit/pending.png .build/33-pending.png

.build/34-pending1.png: deposit/pending1.png
	cp deposit/pending1.png .build/34-pending1.png

.build/35-phone1.png: deposit/phone1.png
	cp deposit/phone1.png .build/35-phone1.png

.build/36-phone2.png: deposit/phone2.png
	cp deposit/phone2.png .build/36-phone2.png

.build/37-profile_pic_1.JPG: deposit/profile_pic_1.JPG
	cp deposit/profile_pic_1.JPG .build/37-profile_pic_1.JPG

.build/38-rejected1.png: deposit/rejected1.png
	cp deposit/rejected1.png .build/38-rejected1.png

.build/39-returned_promise.png: deposit/returned_promise.png
	cp deposit/returned_promise.png .build/39-returned_promise.png

.build/40-returned_promise1.png: deposit/returned_promise1.png
	cp deposit/returned_promise1.png .build/40-returned_promise1.png

.build/41-screen.png: deposit/screen.png
	cp deposit/screen.png .build/41-screen.png

.build/42-spies.png: deposit/spies.png
	cp deposit/spies.png .build/42-spies.png

.build/43-square.png: deposit/square.png
	cp deposit/square.png .build/43-square.png

.build/44-strutture-dati-complesse.png: deposit/strutture-dati-complesse.png
	cp deposit/strutture-dati-complesse.png .build/44-strutture-dati-complesse.png

.build/45-talk_13gennaio_preview.jpg: deposit/talk_13gennaio_preview.jpg
	cp deposit/talk_13gennaio_preview.jpg .build/45-talk_13gennaio_preview.jpg

.build/46-testimage.png: deposit/testimage.png
	cp deposit/testimage.png .build/46-testimage.png

.build/47-then.png: deposit/then.png
	cp deposit/then.png .build/47-then.png

.build/48-then1.png: deposit/then1.png
	cp deposit/then1.png .build/48-then1.png

.build/49-tracing.png: deposit/tracing.png
	cp deposit/tracing.png .build/49-tracing.png

.build/50-ux.png: deposit/ux.png
	cp deposit/ux.png .build/50-ux.png

.build/51-yeah.jpg: deposit/yeah.jpg
	cp deposit/yeah.jpg .build/51-yeah.jpg

_site/deposit/Alto.png: .build/13-Alto.png
	@mkdir -p _site/deposit/
	cp .build/13-Alto.png $@

_site/deposit/background.jpg: .build/14-background.jpg
	@mkdir -p _site/deposit/
	cp .build/14-background.jpg $@

_site/deposit/chevron.png: .build/15-chevron.png
	@mkdir -p _site/deposit/
	cp .build/15-chevron.png $@

_site/deposit/code.org.link.png: .build/16-code.org.link.png
	@mkdir -p _site/deposit/
	cp .build/16-code.org.link.png $@

_site/deposit/cv.pdf: .build/17-cv.pdf
	@mkdir -p _site/deposit/
	cp .build/17-cv.pdf $@

_site/deposit/figure1.png: .build/18-figure1.png
	@mkdir -p _site/deposit/
	cp .build/18-figure1.png $@

_site/deposit/fsm-express-project-image.png: .build/19-fsm-express-project-image.png
	@mkdir -p _site/deposit/
	cp .build/19-fsm-express-project-image.png $@

_site/deposit/fulfilled.png: .build/20-fulfilled.png
	@mkdir -p _site/deposit/
	cp .build/20-fulfilled.png $@

_site/deposit/fulfilled1.png: .build/21-fulfilled1.png
	@mkdir -p _site/deposit/
	cp .build/21-fulfilled1.png $@

_site/deposit/hipeac_presentation.png: .build/22-hipeac_presentation.png
	@mkdir -p _site/deposit/
	cp .build/22-hipeac_presentation.png $@

_site/deposit/ieee-754.png: .build/23-ieee-754.png
	@mkdir -p _site/deposit/
	cp .build/23-ieee-754.png $@

_site/deposit/IMG_0097.JPG: .build/24-IMG_0097.JPG
	@mkdir -p _site/deposit/
	cp .build/24-IMG_0097.JPG $@

_site/deposit/IMG_9201.JPG: .build/25-IMG_9201.JPG
	@mkdir -p _site/deposit/
	cp .build/25-IMG_9201.JPG $@

_site/deposit/img-dyncss.jpg: .build/26-img-dyncss.jpg
	@mkdir -p _site/deposit/
	cp .build/26-img-dyncss.jpg $@

_site/deposit/infographics_workshop_correlations.png: .build/27-infographics_workshop_correlations.png
	@mkdir -p _site/deposit/
	cp .build/27-infographics_workshop_correlations.png $@

_site/deposit/lambda.png: .build/28-lambda.png
	@mkdir -p _site/deposit/
	cp .build/28-lambda.png $@

_site/deposit/landing.png: .build/29-landing.png
	@mkdir -p _site/deposit/
	cp .build/29-landing.png $@

_site/deposit/makingofsc.001.png: .build/30-makingofsc.001.png
	@mkdir -p _site/deposit/
	cp .build/30-makingofsc.001.png $@

_site/deposit/not-bad.jpg: .build/31-not-bad.jpg
	@mkdir -p _site/deposit/
	cp .build/31-not-bad.jpg $@

_site/deposit/opencl-device-query.png: .build/32-opencl-device-query.png
	@mkdir -p _site/deposit/
	cp .build/32-opencl-device-query.png $@

_site/deposit/pending.png: .build/33-pending.png
	@mkdir -p _site/deposit/
	cp .build/33-pending.png $@

_site/deposit/pending1.png: .build/34-pending1.png
	@mkdir -p _site/deposit/
	cp .build/34-pending1.png $@

_site/deposit/phone1.png: .build/35-phone1.png
	@mkdir -p _site/deposit/
	cp .build/35-phone1.png $@

_site/deposit/phone2.png: .build/36-phone2.png
	@mkdir -p _site/deposit/
	cp .build/36-phone2.png $@

_site/deposit/profile_pic_1.JPG: .build/37-profile_pic_1.JPG
	@mkdir -p _site/deposit/
	cp .build/37-profile_pic_1.JPG $@

_site/deposit/rejected1.png: .build/38-rejected1.png
	@mkdir -p _site/deposit/
	cp .build/38-rejected1.png $@

_site/deposit/returned_promise.png: .build/39-returned_promise.png
	@mkdir -p _site/deposit/
	cp .build/39-returned_promise.png $@

_site/deposit/returned_promise1.png: .build/40-returned_promise1.png
	@mkdir -p _site/deposit/
	cp .build/40-returned_promise1.png $@

_site/deposit/screen.png: .build/41-screen.png
	@mkdir -p _site/deposit/
	cp .build/41-screen.png $@

_site/deposit/spies.png: .build/42-spies.png
	@mkdir -p _site/deposit/
	cp .build/42-spies.png $@

_site/deposit/square.png: .build/43-square.png
	@mkdir -p _site/deposit/
	cp .build/43-square.png $@

_site/deposit/strutture-dati-complesse.png: .build/44-strutture-dati-complesse.png
	@mkdir -p _site/deposit/
	cp .build/44-strutture-dati-complesse.png $@

_site/deposit/talk_13gennaio_preview.jpg: .build/45-talk_13gennaio_preview.jpg
	@mkdir -p _site/deposit/
	cp .build/45-talk_13gennaio_preview.jpg $@

_site/deposit/testimage.png: .build/46-testimage.png
	@mkdir -p _site/deposit/
	cp .build/46-testimage.png $@

_site/deposit/then.png: .build/47-then.png
	@mkdir -p _site/deposit/
	cp .build/47-then.png $@

_site/deposit/then1.png: .build/48-then1.png
	@mkdir -p _site/deposit/
	cp .build/48-then1.png $@

_site/deposit/tracing.png: .build/49-tracing.png
	@mkdir -p _site/deposit/
	cp .build/49-tracing.png $@

_site/deposit/ux.png: .build/50-ux.png
	@mkdir -p _site/deposit/
	cp .build/50-ux.png $@

_site/deposit/yeah.jpg: .build/51-yeah.jpg
	@mkdir -p _site/deposit/
	cp .build/51-yeah.jpg $@

.build/52-fontawesome-webfont.woff: assets/fonts/fontawesome-webfont.woff
	cp assets/fonts/fontawesome-webfont.woff .build/52-fontawesome-webfont.woff

.build/53-fontawesome-webfont.ttf: assets/fonts/fontawesome-webfont.ttf
	cp assets/fonts/fontawesome-webfont.ttf .build/53-fontawesome-webfont.ttf

_site/fonts/fontawesome-webfont.woff: .build/52-fontawesome-webfont.woff
	@mkdir -p _site/fonts/
	cp .build/52-fontawesome-webfont.woff $@

_site/fonts/fontawesome-webfont.ttf: .build/53-fontawesome-webfont.ttf
	@mkdir -p _site/fonts/
	cp .build/53-fontawesome-webfont.ttf $@

.build/54-index.html: assets/layouts/base.jade assets/index.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/index.jade < assets/index.jade | beml-cli > .build/54-index.html

.build/55-teaching.html: assets/layouts/base.jade assets/teaching.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/teaching.jade < assets/teaching.jade | beml-cli > .build/55-teaching.html

.build/56-videos.html: assets/layouts/base.jade assets/videos.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/videos.jade < assets/videos.jade | beml-cli > .build/56-videos.html

.build/57-address.html: assets/layouts/base.jade assets/address.jade
	./node_modules/.bin/jade -O ./site.json -P -p assets/address.jade < assets/address.jade | beml-cli > .build/57-address.html

_site/index.html: .build/54-index.html
	@mkdir -p _site/
	cp .build/54-index.html $@

_site/teaching.html: .build/55-teaching.html
	@mkdir -p _site/
	cp .build/55-teaching.html $@

_site/videos.html: .build/56-videos.html
	@mkdir -p _site/
	cp .build/56-videos.html $@

_site/address.html: .build/57-address.html
	@mkdir -p _site/
	cp .build/57-address.html $@

.build/59-angular.min.js: ./bower_components/angular/angular.min.js
	cp bower_components/angular/angular.min.js .build/59-angular.min.js

.build/60-ng-table.js: ./bower_components/ng-table/ng-table.js
	cp bower_components/ng-table/ng-table.js .build/60-ng-table.js

.build/61-fastclick.js: ./bower_components/fastclick/lib/fastclick.js
	cp bower_components/fastclick/lib/fastclick.js .build/61-fastclick.js

.build/62-client.js: assets/css/fonts.css assets/css/obsidian.css assets/js/bundle.js assets/js/calendar.ls assets/js/client.ls assets/js/easyDirective.ls assets/js/entry.ls assets/less/bio.less assets/less/calendar.less assets/less/main.less assets/less/mixin.less assets/less/post.less assets/less/posts.less assets/less/projects.less assets/less/publications.less assets/less/research.less assets/less/reset.less assets/less/segment.less assets/less/sidebar.less assets/less/table.less assets/less/teaching.less assets/less/videos.less assets/vendor/dyncss.js assets/vendor/highlight.min.js
	./node_modules/.bin/browserify -t node-lessify -t liveify assets/js/client.ls -o .build/62-client.js

.build/63-bundle.js: assets/img/chained-image.jpg assets/img/dyn-css-image.jpg assets/img/exemd.jpg assets/img/fsm-express-project-image.jpg assets/img/profile_pic_1_res.jpg assets/img/sidebar_picture.jpg assets/img/sweet-angle-image.jpg assets/img/webmake-image.jpg assets/js/bundle.js
	< assets/js/bundle.js ./node_modules/.bin/brfs - > .build/63-bundle.js

.build/concat-tmp58.js: .build/59-angular.min.js .build/60-ng-table.js .build/61-fastclick.js .build/62-client.js .build/63-bundle.js
	cat $^ > $@

.build/64-concat-tmp58.min.js: .build/concat-tmp58.js
	uglifyjs .build/concat-tmp58.js -c -m  > $@

_site/js: 
	mkdir -p _site/js

_site/js/client.js: .build/64-concat-tmp58.min.js _site/js
	cp .build/64-concat-tmp58.min.js $@

.PHONY : build-assets
build-assets: _site/img/favicon.png _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg _site/data/biblio.json _site/data/projects.json _site/deposit/Alto.png _site/deposit/background.jpg _site/deposit/chevron.png _site/deposit/code.org.link.png _site/deposit/cv.pdf _site/deposit/figure1.png _site/deposit/fsm-express-project-image.png _site/deposit/fulfilled.png _site/deposit/fulfilled1.png _site/deposit/hipeac_presentation.png _site/deposit/ieee-754.png _site/deposit/IMG_0097.JPG _site/deposit/IMG_9201.JPG _site/deposit/img-dyncss.jpg _site/deposit/infographics_workshop_correlations.png _site/deposit/lambda.png _site/deposit/landing.png _site/deposit/makingofsc.001.png _site/deposit/not-bad.jpg _site/deposit/opencl-device-query.png _site/deposit/pending.png _site/deposit/pending1.png _site/deposit/phone1.png _site/deposit/phone2.png _site/deposit/profile_pic_1.JPG _site/deposit/rejected1.png _site/deposit/returned_promise.png _site/deposit/returned_promise1.png _site/deposit/screen.png _site/deposit/spies.png _site/deposit/square.png _site/deposit/strutture-dati-complesse.png _site/deposit/talk_13gennaio_preview.jpg _site/deposit/testimage.png _site/deposit/then.png _site/deposit/then1.png _site/deposit/tracing.png _site/deposit/ux.png _site/deposit/yeah.jpg _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf _site/index.html _site/teaching.html _site/videos.html _site/address.html _site/js/client.js

.PHONY : build
build: build-assets

.PHONY : cmd-65
cmd-65: 
	./node_modules/.bin/blog-cli md2json directory ./posts -d _site/data/posts -t ./assets/layouts/post.jade -c ./site.json

.PHONY : build-posts
build-posts: cmd-65

.PHONY : cmd-66
cmd-66: 
	./node_modules/.bin/blog-cli json2html directory ./_site/data/posts -d ./_site

.PHONY : cmd-67
cmd-67: 
	./node_modules/.bin/blog-cli json2json  ./_site/data/posts -k blog -t ./assets/blog.jade -c ./site.json > ./_site/blog.html

.PHONY : cmd-68
cmd-68: 
	./node_modules/.bin/blog-cli json2json  ./_site/data/posts > ./_site/data/index.json

.PHONY : cmd-69
cmd-69: 
	./node_modules/.bin/blog-cli renderjson -f  ./_site/data/projects.json -t ./assets/projects.jade -c ./site.json > ./_site/projects.html

.PHONY : cmd-70
cmd-70: 
	./node_modules/.bin/json2html-biblio -f ./data/biblio.json -t ./assets/research.jade -c ./site.json > ./_site/research.html

.PHONY : cmd-71
cmd-71: 
	./node_modules/.bin/sitemap-cli generate -p http://www.vittoriozaccaria.net _site > _site/sitemap.xml

.PHONY : derived
derived: cmd-66 cmd-67 cmd-68 cmd-69 cmd-70 cmd-71

.PHONY : cmd-72
cmd-72: 
	./node_modules/.bin/serve _site -p 4000

.PHONY : serve
serve: cmd-72

.PHONY : cmd-73
cmd-73: 
	make build

.PHONY : cmd-74
cmd-74: 
	make build-posts

.PHONY : cmd-75
cmd-75: 
	make derived

.PHONY : cmd-seq-76
cmd-seq-76: 
	make cmd-73
	make cmd-74
	make cmd-75

.PHONY : all
all: cmd-seq-76

.PHONY : clean-77
clean-77: 
	rm -rf .build/0-favicon.png .build/1-fsm-express-project-image.png .build/2-webmake-image.png .build/3-chained-image.jpg .build/4-dyn-css-image.jpg .build/5-exemd.jpg .build/6-fsm-express-project-image.jpg .build/7-profile_pic_1_res.jpg .build/8-sidebar_picture.jpg .build/9-sweet-angle-image.jpg .build/10-webmake-image.jpg _site/img/favicon.png _site/img/fsm-express-project-image.png _site/img/webmake-image.png _site/img/chained-image.jpg _site/img/dyn-css-image.jpg _site/img/exemd.jpg _site/img/fsm-express-project-image.jpg _site/img/profile_pic_1_res.jpg _site/img/sidebar_picture.jpg _site/img/sweet-angle-image.jpg _site/img/webmake-image.jpg .build/11-biblio.json .build/12-projects.json _site/data/biblio.json _site/data/projects.json .build/13-Alto.png .build/14-background.jpg .build/15-chevron.png .build/16-code.org.link.png .build/17-cv.pdf .build/18-figure1.png .build/19-fsm-express-project-image.png .build/20-fulfilled.png .build/21-fulfilled1.png .build/22-hipeac_presentation.png .build/23-ieee-754.png .build/24-IMG_0097.JPG .build/25-IMG_9201.JPG .build/26-img-dyncss.jpg .build/27-infographics_workshop_correlations.png .build/28-lambda.png .build/29-landing.png .build/30-makingofsc.001.png .build/31-not-bad.jpg .build/32-opencl-device-query.png .build/33-pending.png .build/34-pending1.png .build/35-phone1.png .build/36-phone2.png .build/37-profile_pic_1.JPG .build/38-rejected1.png .build/39-returned_promise.png .build/40-returned_promise1.png .build/41-screen.png .build/42-spies.png .build/43-square.png .build/44-strutture-dati-complesse.png .build/45-talk_13gennaio_preview.jpg .build/46-testimage.png .build/47-then.png .build/48-then1.png .build/49-tracing.png .build/50-ux.png .build/51-yeah.jpg _site/deposit/Alto.png _site/deposit/background.jpg _site/deposit/chevron.png _site/deposit/code.org.link.png _site/deposit/cv.pdf _site/deposit/figure1.png _site/deposit/fsm-express-project-image.png _site/deposit/fulfilled.png _site/deposit/fulfilled1.png _site/deposit/hipeac_presentation.png _site/deposit/ieee-754.png _site/deposit/IMG_0097.JPG _site/deposit/IMG_9201.JPG _site/deposit/img-dyncss.jpg _site/deposit/infographics_workshop_correlations.png _site/deposit/lambda.png _site/deposit/landing.png _site/deposit/makingofsc.001.png _site/deposit/not-bad.jpg _site/deposit/opencl-device-query.png _site/deposit/pending.png _site/deposit/pending1.png _site/deposit/phone1.png _site/deposit/phone2.png _site/deposit/profile_pic_1.JPG _site/deposit/rejected1.png _site/deposit/returned_promise.png _site/deposit/returned_promise1.png _site/deposit/screen.png _site/deposit/spies.png _site/deposit/square.png _site/deposit/strutture-dati-complesse.png _site/deposit/talk_13gennaio_preview.jpg _site/deposit/testimage.png _site/deposit/then.png _site/deposit/then1.png _site/deposit/tracing.png _site/deposit/ux.png _site/deposit/yeah.jpg .build/52-fontawesome-webfont.woff .build/53-fontawesome-webfont.ttf _site/fonts/fontawesome-webfont.woff _site/fonts/fontawesome-webfont.ttf .build/54-index.html .build/55-teaching.html .build/56-videos.html .build/57-address.html _site/index.html _site/teaching.html _site/videos.html _site/address.html .build/59-angular.min.js .build/60-ng-table.js .build/61-fastclick.js .build/62-client.js .build/63-bundle.js .build/concat-tmp58.js .build/64-concat-tmp58.min.js _site/js _site/js/client.js

.PHONY : clean-78
clean-78: 
	rm -rf .build

.PHONY : clean-79
clean-79: 
	mkdir -p .build

.PHONY : cmd-80
cmd-80: 
	rm -rf _site/*

.PHONY : clean
clean: clean-77 clean-78 clean-79 cmd-80

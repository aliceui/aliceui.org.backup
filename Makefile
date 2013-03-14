THEME = $(HOME)/.spm/themes/alice

build-doc:
	@nico build -v -C $(THEME)/nico.js

debug:
	@nico server -v -C $(THEME)/nico.js --watch debug

server:
	@nico server -v -C $(THEME)/nico.js

watch:
	@nico server -v -C $(THEME)/nico.js --watch

publish: clean build-doc
	@git checkout master
	@git pull origin master
	@ghp-import -b master -p _site

clean:
	@rm -fr _site


.PHONY: build-doc debug server publish clean

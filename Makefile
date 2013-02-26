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
	@ghp-import _site
	@git push origin gh-pages

clean:
	@rm -fr _site

upgrade-alice:
	@cd static/allinone && spm build
	@cd ../..
	@git commit -am 'upgrade allinone modules'

reporter = spec
url = tests/runner.html
test:
	@mocha-phantomjs --reporter=${reporter} http://127.0.0.1:8000/$(url)

coverage:
	@rm -fr _site/src-cov
	@jscoverage --encoding=utf8 src _site/src-cov
	@$(MAKE) test reporter=json-cov url=tests/runner.html?coverage=1 | node $(THEME)/html-cov.js > coverage.html
	@echo "Build coverage to coverage.html"


.PHONY: build-doc debug server publish clean test coverage

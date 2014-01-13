TESTS = ./test/support/http.js ./test/router.coffee

test:
	@./node_modules/.bin/mocha --require should --compilers coffee:coffee-script $(TESTS) 

test-docs:
	@./node_modules/.bin/mocha --reporter markdown --require should --compilers coffee:coffee-script $(TESTS) > doc.html

compile:
	@./node_modules/.bin/coffee -o lib src

link: test compile
	npm link

pack: test compile
	npm pack

.PHONY: test compile

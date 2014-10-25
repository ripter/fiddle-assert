.PHONY: all build run test test-debug lint clean

all: build

build: node_modules/ dist/
	./node_modules/.bin/browserify src/main.js -s Assert > dist/build.js

run: build
	./node_modules/.bin/http-server

dist/:
	mkdir ./dist

test:
	./node_modules/.bin/mocha -CR nyan

test-debug:
	node debug ./node_modules/.bin/mocha -CR nyan

lint:
	./node_modules/.bin/jshint src

clean:
	-npm cache clear
	-rm -R ./dist
	-rm -R ./node_modules

node_modules/: package.json
	npm install
	touch $@

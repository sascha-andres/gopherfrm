.PHONY: build publish

build: 						## build the web page
	- rm -rf public
	hugo
publish: build 		## publish to site
	rsync -aviz --delete -e ssh public/ strato:/mnt/web210/e2/69/53837969/htdocs/gopherfrm.livingit.de/www

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

SHELL := bash
.SHELLFLAGS := -euo pipefail -c
.ONESHELL:

all: serve

# Where rstblog creates the static site
BUILD_DIR=_build

OUT_GIT_DIR=$$HOME/www/blog-out

STORAGE_DIR=storage

MAX_DELETE=10

MARKDOWNLINT_OPTS=--ignore node_modules --ignore _build --ignore talks --ignore apps/index.md --ignore games/index.md

include config.mk

clean:
	rm -rf $(BUILD_DIR)

build: check-deps
	run-rstblog build
	[ -e _build/$(STORAGE_DIR) ] || ln -s $$PWD/$(STORAGE_DIR) _build/$(STORAGE_DIR)

serve: build
	run-rstblog serve

deploy: check-tree clean lint build pull-out-dir rsync-to-out-dir commit-out-dir push-out-dir

deploy-all: deploy deploy-storage

download-storage:
	rsync -avzP $(STORAGE_BACKUP_URL)/ $(STORAGE_DIR)

deploy-storage:
	@echo "== Updating backup site =="
	rsync -avzP $(STORAGE_DIR)/ $(STORAGE_BACKUP_URL)
	@echo "== Deploying =="
	rsync -avzP $(STORAGE_DIR)/ $(DEPLOY_ROOT_URL)/$(STORAGE_DIR)

# internal targets
pull-out-dir:
	@echo "== Checking out dir is up to date =="
	git -C $(OUT_GIT_DIR) pull

rsync-to-out-dir:
	@echo "== Rsyncing changes to out dir =="
	rsync -av --delete --max-delete=$(MAX_DELETE) --exclude '.git' --exclude $(STORAGE_DIR) \
		$(BUILD_DIR)/ $(OUT_GIT_DIR)

commit-out-dir:
	@echo "== Commiting changes in out dir =="
	cd $(OUT_GIT_DIR) && git add .
	cd $(OUT_GIT_DIR) && git commit -a -m 'Deploying'

push-out-dir:
	@echo "== Pushing out dir changes =="
	cd $(OUT_GIT_DIR) && git push

check-tree: commit-changes push-local-commits

commit-changes:
	@if [ -n "$$(git status -s)" ] ; then
		echo "== Committing changes =="
		git add . && git commit && $(MAKE) commit-changes
	fi

push-local-commits:
	@nb_commits=$$(git rev-list origin/master..master | wc -l)
	if [ "$$nb_commits" -gt 0 ] ; then
		echo "== Pushing local-only commits =="
		git push && $(MAKE) push-local-commits
	fi

lint:
	# Requires `make install-deps`
	markdownlint $(MARKDOWNLINT_OPTS) \
		$$PWD

fixlint:
	markdownlint $(MARKDOWNLINT_OPTS) \
		--fix \
		$$PWD

install-deps: install-markdownlint
	sudo apt install sassc rsync

NPM_BINARY=$(VIRTUAL_ENV)/bin/npm

install-markdownlint: $(NPM_BINARY)
	npm install -g markdownlint-cli@0.23.0

$(NPM_BINARY):
	pip install nodeenv==1.4.0
	nodeenv --python-virtualenv --node 14.5.0

check-deps:
	which sassc > /dev/null
	which rsync > /dev/null
	which run-rstblog > /dev/null
	which markdownlint > /dev/null

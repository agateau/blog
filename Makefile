SHELL := bash
.SHELLFLAGS := -euo pipefail -c
.ONESHELL:

all: serve

# Where rstblog creates the static site
BUILD_DIR=_build

OUT_GIT_DIR=$$HOME/www/blog-out

STORAGE_DIR=storage

MAX_DELETE=10

DEPENDENCIES=sassc rsync run-rstblog git

include config.mk

clean:
	rm -rf $(BUILD_DIR)

build: check-deps config.yml
	run-rstblog build
	[ -e _build/$(STORAGE_DIR) ] || ln -s $$PWD/$(STORAGE_DIR) _build/$(STORAGE_DIR)

config.yml: static/style.scss
	hash=$$(md5sum static/style.scss | awk '{print $$1}')
	sed -i "s/css_hash: .*/css_hash: $$hash/" config.yml

serve: build
	run-rstblog serve

deploy: check-tree clean build pull-out-dir rsync-to-out-dir commit-out-dir push-out-dir

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

install-deps:
	sudo apt install sassc rsync

NPM_BINARY=$(VIRTUAL_ENV)/bin/npm

check-deps:
	@echo "Checking dependencies..."
	@for dep in $(DEPENDENCIES) ; do
		if ! which $$dep > /dev/null ; then
			echo "Missing dependency: $$dep"
			exit 1
		fi
	done

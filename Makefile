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

STEP=_scripts/step

include config.mk

clean: ## Delete the build dir
	rm -rf $(BUILD_DIR)

build: check-deps config.yml ## Build the site
	run-rstblog build
	[ -e _build/$(STORAGE_DIR) ] || ln -s $$PWD/$(STORAGE_DIR) _build/$(STORAGE_DIR)

config.yml: static/style.scss ## Update css_hash in config.yml based on static/style.scss
	hash=$$(md5sum static/style.scss | awk '{print $$1}')
	sed -i "s/css_hash: .*/css_hash: $$hash/" config.yml

serve: build  ## Build the site and start a server to test it
	run-rstblog serve

just-serve:
	cd $(BUILD_DIR)
	python -m http.server 5000

deploy: check-tree clean build pull-out-dir rsync-to-out-dir commit-out-dir push-out-dir ## Deploy latest content

deploy-all: deploy deploy-storage ## Deploy content and storage

download-storage: ## Update STORAGE_DIR from backup site
	rsync -avzP $(STORAGE_BACKUP_URL)/ $(STORAGE_DIR)

deploy-storage: ## `rsync` STORAGE_DIR to backup and deploy sites
	@$(STEP) "Updating backup site"
	rsync -avzP $(STORAGE_DIR)/ $(STORAGE_BACKUP_URL)
	@$(STEP) "Deploying"
	rsync -avzP $(STORAGE_DIR)/ $(DEPLOY_ROOT_URL)/$(STORAGE_DIR)

# internal targets
pull-out-dir: ## `git pull` in OUT_GIT_DIR
	@$(STEP) "Checking out dir is up to date"
	git -C $(OUT_GIT_DIR) pull

rsync-to-out-dir: ## `rsync` the build dir to OUT_GIT_DIR
	@$(STEP) "Rsyncing changes to out dir"
	rsync -av --delete --max-delete=$(MAX_DELETE) --exclude '.git' --exclude $(STORAGE_DIR) \
		$(BUILD_DIR)/ $(OUT_GIT_DIR)

commit-out-dir: ## `git commit` changes in OUT_GIT_DIR
	@$(STEP) "Commiting changes in out dir"
	cd $(OUT_GIT_DIR) && git add .
	cd $(OUT_GIT_DIR) && git commit -a -m 'Deploying'

push-out-dir: ## `git push` changes in OUT_GIT_DIR
	@$(STEP) "Pushing out dir changes"
	cd $(OUT_GIT_DIR) && git push

check-tree: commit-changes push-local-commits

commit-changes: ## `git commit` local changes
	@if [ -n "$$(git status -s)" ] ; then
		@$(STEP) "Committing changes"
		git add . && git commit && $(MAKE) commit-changes
	fi

push-local-commits: ## `git push` non-pushed-yet commits
	@nb_commits=$$(git rev-list origin/master..master | wc -l)
	if [ "$$nb_commits" -gt 0 ] ; then
		@$(STEP) "Pushing local-only commits"
		git push && $(MAKE) push-local-commits
	fi

install-deps: ## Install required dependencies using apt
	sudo apt install sassc rsync

NPM_BINARY=$(VIRTUAL_ENV)/bin/npm

check-deps: ## Check all required dependencies are installed
	@$(STEP) "Checking dependencies..."
	@for dep in $(DEPENDENCIES) ; do
		if ! which $$dep > /dev/null ; then
			echo "Missing dependency: $$dep"
			exit 1
		fi
	done

help: ## List commands
	@grep '^[a-zA-Z]' Makefile | sort \
		| awk -F ':.*?## ' 'NF==2 {printf "  %-26s%s\n", $$1, $$2}'

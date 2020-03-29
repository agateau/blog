all: serve

# Where rstblog creates the static site
BUILD_DIR=_build

OUT_GIT_DIR=$$HOME/www/blog-out

STORAGE_DIR=storage

MAX_DELETE=10

include config.mk

clean:
	rm -rf $(BUILD_DIR)

checkdeps:
	which sassc > /dev/null
	which run-rstblog > /dev/null
	which rsync > /dev/null
	which markdownlint > /dev/null

build: checkdeps
	run-rstblog build
	[ -e _build/$(STORAGE_DIR) ] || ln -s $$PWD/$(STORAGE_DIR) _build/$(STORAGE_DIR)

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

check-tree: check-clean-tree check-need-push

check-clean-tree:
	@echo "== Checking tree is clean =="
	@if [ -n "$$(git status -s)" ] ; then \
		echo "Tree is not clean:" ; \
		git status -s ; \
		echo -n "Commit all changes? [yN] " ; \
		read answer ; \
		if [ "$$answer" = "y" ] ; then \
			git add . && git commit && $(MAKE) check-clean-tree ; \
		else \
			exit 1 ; \
		fi \
	fi

check-need-push:
	@echo "== Checking no commits need to be pushed =="
	@nb=$$(git rev-list origin/master..master | wc -l) ; \
	if [ "$$nb" -ne 0 ] ; then \
		echo "master has $$nb commit(s) to push." \
		echo -n "Push them? [yN] " ; \
		read answer ; \
		if [ "$$answer" = "y" ] ; then \
			git push && $(MAKE) check-need-push ; \
		else \
			exit 1 ; \
		fi \
	fi

lint:
	# Requires `make install-lint`
	markdownlint \
		--ignore node_modules --ignore _build --ignore talks \
		$$PWD

fixlint:
	markdownlint \
		--fix \
		--ignore node_modules --ignore _build --ignore talks \
		$$PWD

install-lint:
	pip install nodeenv
	nodeenv -p
	npm install -g markdownlint-cli

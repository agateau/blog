all: serve

# Where rstblog creates the static site
BUILD_DIR=_build

OUT_GIT_DIR=$$HOME/www/blog-out

STORAGE_DIR=storage

include config.mk

clean:
	rm -rf $(BUILD_DIR)

checkdeps:
	which sassc > /dev/null
	which convert > /dev/null
	which run-rstblog > /dev/null
	which rsync > /dev/null

build: checkdeps
	run-rstblog build
	ln -sf $$PWD/$(STORAGE_DIR) _build/$(STORAGE_DIR)

serve: build
	run-rstblog serve

deploy: check-tree clean build update-out-dir commit-out-dir push-out-dir

deploy-all: deploy deploy-storage

download-storage:
	rsync -avzP $(STORAGE_BACKUP_URL)/ $(STORAGE_DIR)

deploy-storage:
	@echo "== Updating backup site =="
	rsync -avzP $(STORAGE_DIR)/ $(STORAGE_BACKUP_URL)
	@echo "== Deploying =="
	rsync -avzP $(STORAGE_DIR)/ $(DEPLOY_ROOT_URL)/$(STORAGE_DIR)

# internal targets
update-out-dir:
	@echo "== Updating out dir =="
	rsync -av --delete --max-delete=10 --exclude '.git' --exclude $(STORAGE_DIR) \
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
		echo "Tree is not clean. Commit your changes." ; \
		git status -s ; \
		exit 1 ; \
	fi

check-need-push:
	@echo "== Checking no commits need to be pushed =="
	@nb=$$(git rev-list origin/master..master | wc -l) ; \
	if [ "$$nb" -ne 0 ] ; then \
		echo "master has $$nb commit(s) to push. Push them." ; \
		exit 1 ; \
	fi

all: build

OUT_GIT_DIR=$$HOME/www/blog-out

clean:
	rm -rf _build

build:
	run-rstblog build

serve:
	run-rstblog serve

deploy:
	rsync -av --delete --max-delete=10 --exclude '.git' _build/ $(OUT_GIT_DIR)
	cd $(OUT_GIT_DIR) && git add .
	cd $(OUT_GIT_DIR) && git ci -a -m 'Deploying'
	cd $(OUT_GIT_DIR) && git push

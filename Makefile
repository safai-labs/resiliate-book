.PHONY: build clean deploy serve stop status firewall

build:
	mdbook build
	./fix-base-urls.sh

clean:
	rm -rf book

deploy: build
	rsync -Pav book/ get.saf.ai:projects/docs.saf.ai/

serve:
	./mdbook-start.sh

stop:
	./mdbook-stop.sh

status:
	./mdbook-status.sh

firewall:
	sudo ./configure-mdbook-firewall.sh


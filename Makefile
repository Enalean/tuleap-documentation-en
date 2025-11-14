# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS       =
SPHINXBUILD      = LC_ALL=C sphinx-build
SPHINX_AUTOBUILD = LC_ALL=C sphinx-autobuild
BUILDDIR         = _build
LANG             = en

# Internal variables.
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(SPHINXOPTS) tmp/$(LANG)
WATCHOPTS       = -d $(BUILDDIR)/doctrees $(SPHINXOPTS) languages/$(LANG)

.DEFAULT_GOAL:= default
.PHONY: help clean html singlehtml linkcheck

# Taken from zf-framework documentation
pre-build:
	-rm -rf tmp/$(LANG)
	@mkdir -p tmp/$(LANG)
	@cp -R languages/en/* tmp/$(LANG)/
ifneq ($(LANG),en)
	@for f in $$(cd languages/$(LANG) && find . -type f \( ! -iname ".*" \) | sort); do \
		if [ -f languages/en/$$f ]; then \
			if [ $$(stat -c %s languages/$(LANG)/$$f) = $$(stat -c %s languages/en/$$f) ]; then \
				echo "The file '$$f' seems to be exactly the same as English one, perhaps it could be deleted"; \
			fi; \
			cp languages/$(LANG)/$$f tmp/$(LANG)/$$f; \
		else \
			echo "The file '$$f' is not anymore in English directory, check if it's renamed or deleted"; \
		fi; \
	done
endif
	@cp languages/en/conf.py tmp/$(LANG)/conf.py
	@sed -i.bak 's/#language = None/language = "$(LANG)"/' tmp/$(LANG)/conf.py
	@rm -f tmp/$(LANG)/conf.py.bak

help:
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean:
	-rm -rf tmp/*
	-rm -rf $(BUILDDIR)/*

html: pre-build ## Make standalone HTML files
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html/$(LANG)
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

singlehtml: pre-build ## Make a single large HTML file
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml/$(LANG)
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

linkcheck: pre-build ## Check all external links for integrity
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck/$(LANG)
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

watch-html: pre-build ## Watch the files and rebuild
	$(SPHINX_AUTOBUILD) -b html $(WATCHOPTS) $(BUILDDIR)/html --port 5000 --open-browser

watch-html-online-docs: pre-build ## Watch the files for the Tuleap online docs theme
	@$(MAKE) watch-html SPHINXOPTS="-D html_theme=tuleap_online_doc"

docker-html:
	docker run --rm -ti -u `id -u`:`id -g` -v $(CURDIR):/sources enalean/build-documentation make html

default: help

# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS       =
SPHINXBUILD      = sphinx-build
SPHINX_AUTOBUILD = sphinx-autobuild
BUILDDIR         = _build
LANG             = en

# Internal variables.
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(SPHINXOPTS) tmp/$(LANG)
WATCHOPTS       = -d $(BUILDDIR)/doctrees $(SPHINXOPTS) languages/$(LANG)

.PHONY: help clean html singlehtml linkcheck

# Taken from zf-framework documentation
pre-build:
	@rm -rf tmp/$(LANG)
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
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  linkcheck  to check all external links for integrity"

clean:
	-rm -rf tmp
	-rm -rf $(BUILDDIR)/*

html: pre-build
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html/$(LANG)
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

singlehtml: pre-build
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml/$(LANG)
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

linkcheck: pre-build
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck/$(LANG)
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

watch-html: pre-build
	$(SPHINX_AUTOBUILD) -b html $(WATCHOPTS) $(BUILDDIR)/html --port 5000 --open-browser

docker-html:
	docker run --rm -ti -u $(id -u):$(id -g) -v $(CURDIR):/sources enalean/build-documentation make html

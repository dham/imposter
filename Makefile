# Makefile for installing the imposter package. Some LaTeX commands are also
# provided for your convenience.

%.dvi: %.tex 
	latex $^ 
	if fgrep "Rerun to" $*.log; then $(MAKE) --assume-new $^ $@;fi

%.ps: %.dvi
	dvips -o $@ $^ 

%.pdf: %.ps
	ps2pdf $^

# Special rule to force example rebuilds when the class is changed.
example.dvi: imposter.cls

#Name of the package
CLASS=imposter
# Install location defaults to the user's own texmf
INSTALLDIR?=$(shell kpsewhich -var-value TEXMFHOME)
LOCALDOC=$(INSTALLDIR)/doc
LATEXLOC=$(INSTALLDIR)
PACKAGEFILES=$(CLASS).cls imperial.eps \
    imperial_white_on_clear_background_logo.eps AMCG.eps a0size.sty \
    nerclogo.eps epsrc.eps reading_white_on_clear_background_logo.eps CDT.eps MPE-logo.eps

#FONTFILES=
DOCFILES=README.md Makefile example.tex example_mpecdt.tex
PSFILES=example.ps example.pdf 
TARGETS=$(CLASS).tgz $(CLASS).zip ChangeLog

.PHONY: install
# Install the package in the local tex directory.
install:
#Making these directories will fail if they already exist so this 
#ought to be safe.
#	install -d $(LATEXLOC)/tex/latex/base
	install -d $(LATEXLOC)/tex/latex/$(CLASS)
	install -d $(LOCALDOC)/$(CLASS)
	install -p $(PACKAGEFILES) $(LATEXLOC)/tex/latex/$(CLASS)
#	install -p $(FONTFILES) $(LATEXLOC)/tex/latex/base
	install -p $(DOCFILES) $(LOCALDOC)/$(CLASS)
	texhash

.PHONY: uninstall
# Uninstall this package.
uninstall:
	rm -rf $(foreach FILE, $(PACKAGEFILES), $(LATEXLOC)/tex/latex/$(CLASS)/$(FILE))
	rmdir --ignore-fail-on-non-empty $(LATEXLOC)/tex/latex/$(CLASS)
	rm -rf $(foreach FILE, $(FONTFILES), $(LATEXLOC)/tex/latex/base/$(FILE))
	rmdir --ignore-fail-on-non-empty $(LATEXLOC)/tex/latex/base
	rm -rf $(foreach FILE, $(DOCFILES), $(LOCALDOC)/tex/latex/$(CLASS)/$(FILE))
	rmdir --ignore-fail-on-non-empty $(LOCALDOC)/$(CLASS)
	texhash

.PHONY: clean

# We don't rm *.ps because that might clobber image files. Instead, put any
# ps files which should go in $(PSFILES)
clean: 
	rm $(TARGETS) $(PSFILES) *.dvi *.aux *.log 2>/dev/null||true

.PHONY: archives

# Produce distributable archives.
archives:
	cd ..; tar --create --gzip --verbose --exclude='CVS/*' --exclude='CVS' --exclude='*~' \
--exclude='*.tgz' --exclude='*.zip' --file  $(notdir $(PWD))/$(CLASS).tgz $(notdir $(PWD))
	cd ..; zip -r $(notdir $(PWD))/$(CLASS).zip $(notdir $(PWD)) \
-x '*CVS*' -x '*~' -x '*.tgz' -x '*.zip'

R := R
RCMD := $(R) --slave

document:
	@$(RCMD) -e "devtools::document()"

test:
	@$(RCMD) -e "devtools::test()"

check:
	@$(RCMD) -e "devtools::check()"

revcheck:
	@$(RCMD) -e "if (!requireNamespace('revdepcheck')) install.packages('revdepcheck')"
	@$(RCMD) -e "revdepcheck::revdep_check()"
	@$(RCMD) -f "revdep/check.R"

crancheck: document
	@$(R) CMD build .
	@$(R) CMD check *.tar.gz

install:
	$(R) CMD INSTALL ./

clean:
	@rm -rf *.tar.gz *.Rcheck revdep

README.md: README.Rmd
	$(RCMD) -e "rmarkdown::render('$^')"
	rm README.html

BRANCH := $(shell git branch --show-current | sed 's/[a-z]*\///')
releasePRs:
	@echo Creating PR to master
	@gh pr create -a "@me" -f -B master -l "release" -p "Tom" -t "Release $(BRANCH)"
	@echo Creating PR to dev
	@gh pr create -a "@me" -f -B dev -l "release" -p "Tom" -t "Release $(BRANCH) into dev"

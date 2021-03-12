.PHONY: gitserver
gitserver: $(builddir) $(builddir)/.gitserver

$(builddir)/.gitserver: $(builddir)/.fetch_gitserver
	@touch $@

$(builddir)/.fetch_gitserver: 
	@if [ x"$(gitserver)" != "x" ] ; then \
       ln -sf $(gitserver) $(builddir)/gitserver; \
     else \
       mkdir -p $(builddir)/gitserver; \
	   cd $(builddir)/gitserver; \
	   $(scriptsdir)/fetch-gitserver.sh; \
     fi
	@touch $@


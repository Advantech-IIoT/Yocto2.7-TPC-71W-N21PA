.PHONY: clean
clean: 
	@rm -rf $(builddir)/yocto

.PHONY: distclean
distclean: 
	@rm -rf $(builddir)

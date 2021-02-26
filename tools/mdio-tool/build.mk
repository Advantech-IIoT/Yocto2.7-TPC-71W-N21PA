.PHONY: build
build: $(builddir) $(builddir)/.fetch $(builddir)/.compile

$(builddir)/.fetch: 
	@cp -a *.[ch] $(builddir)
	@touch $@

$(builddir)/.compile: $(TARGET)

$(TARGET): 
	@cd $(builddir) && $(CC) $(CFLAGS) -o $(TARGET) $(SRCS)

$(builddir): 
	@mkdir -p $@


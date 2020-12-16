.PHONY: yocto
yocto: builddir yoctodir gitserver repo $(builddir)/.yocto

yocto_clean: 
	@rm -rf $(yoctodir)

$(builddir)/.yocto: \
	$(yoctodir)/.repo_init_yocto \
	$(yoctodir)/.repo_sync_yocto \
	$(yoctodir)/.setup_yocto \
	$(yoctodir)/.extra_local_conf_yocto

$(yoctodir)/.repo_init_yocto: 
	@cd $(yoctodir) && $(repobin) init -u $(currdir) -b $(shell git branch  | grep -s "^* " | sed -e "s/^\* //") -m $(yoctomanifest)
	@sed -i $(yoctodir)/.repo/manifest.xml -e "s%{{manifestserver}}%file://$(currdir)%g"
	@sed -i $(yoctodir)/.repo/manifest.xml -e "s%{{gitserver}}%file://$(builddir)/gitserver%g"
	@touch $@

$(yoctodir)/.repo_sync_yocto: 
	@cd $(yoctodir) && $(repobin) sync
	@ln -sf $(currdir)/fsl-setup-release.sh $(yoctodir)
	@ln -sf $(currdir)/setup-environment $(yoctodir)
	@ln -sf $(currdir)/README-yocto $(yoctodir)
	@ln -sf $(currdir)/README-IMXBSP $(yoctodir)
	@touch $@

$(yoctodir)/.setup_yocto: 
ifdef YOCTO_WORK_DIR
	@mkdir -p $(YOCTO_WORK_DIR)
endif
	@rm -rf $(yoctobuilddir)
	@cd $(yoctodir) && MACHINE=$(yoctomachine) DISTRO=$(yoctodistro) EULA=1 source fsl-setup-release.sh -b $(yoctobuilddir) -e $(yoctodistro)
ifdef YOCTO_WORK_DIR
	@ln -sf $(YOCTO_WORK_DIR) $(yoctodir)/$(yoctobuilddir)/workdir
endif
	@ln -sf $(scriptsdir)/env-creator $(yoctodir)/$(yoctobuilddir)
	@touch $(yoctodir)/$(yoctobuilddir)/conf/sanity.conf

$(yoctodir)/.extra_local_conf_yocto: 
	@rm -rf $(yoctodir)/$(yoctobuilddir)/conf/extra-local.conf
	@echo "$${extra_local_conf_str}" > $(yoctodir)/$(yoctobuilddir)/conf/extra-local.conf 

.PHONY: yoctodir
yoctodir: $(yoctodir)

$(yoctodir):
	@mkdir -p $@


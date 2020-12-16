.PHONY: info
info: 
	@printf "\n"
	@printf "%-30s: %s\n" "currdir" "$(currdir)"
	@printf "%-30s: %s\n" "builddir" "$(builddir)"
	@printf "%-30s: %s\n" "repobin" "$(repobin)"
	@printf "%-30s: %s\n" "yoctodir" "$(yoctodir)"
	@printf "%-30s: %s\n" "yoctomanifest" "$(yoctomanifest)"
	@[ x"$(gitserver)" != "x" ] && printf "%-30s: %s\n" "gitserver" "$(gitserver)" || echo "no gitserver!!"
	@printf "\n"

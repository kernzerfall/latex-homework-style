SRC_DIR := kernzerfall_hw
BLD_DIR := build

default: clean package
.PHONY:  package clean

clean:
	@rm -rf "${BLD_DIR}" "${SRC_DIR}"

package:
ifneq (,$(wildcard ${SRC_DIR}/.)) 
	$(error Source Directory already exists!)
endif
ifneq (,$(wildcard ${BLD_DIR}/.))
	@printf "\033[33mBuild Directory already exists.\033[0m\n"
	@rm -rfi "${BLD_DIR}"
endif
	@mkdir -p "${SRC_DIR}"
	@mkdir -p "${BLD_DIR}"
	@cp ./kernzerfall_hw.sty ./group.csv "${SRC_DIR}"
	tar cvJf build/release.tar.xz kernzerfall_hw/
	tar cvzf build/release.tar.gz kernzerfall_hw/
	tar cvjf build/release.tar.bz2 kernzerfall_hw/
	zip -9 -r build/release.zip kernzerfall_hw/
# -----------------------------------------------------------------------------
# Build CV (Awesome-CV format) and Resume (Deedy format) into assets/pdf/.
#
# Both source trees live in this repo:
#   cv/     -> compiled to assets/pdf/cv.pdf
#   resume/ -> compiled to assets/pdf/resume.pdf
#
# The LaTeX class files (awesome-cv.cls, deedy-resume-openfont.cls, fonts)
# live inside the cv-templates/Awesome-PhD-CV submodule. We point xelatex at
# them via TEXINPUTS so the user-editable source files stay clean and
# template updates can be pulled with `git submodule update --remote`.
#
# Requirements: xelatex, fontspec, and the fonts referenced by each template
# (Roboto for Awesome-CV, Lato + Raleway for Deedy). On Ubuntu:
#   sudo apt install texlive-xetex texlive-fonts-recommended texlive-fonts-extra
#
# Usage:
#   make            # build both PDFs
#   make cv         # build just the CV
#   make resume     # build just the resume
#   make clean      # remove LaTeX intermediate files
# -----------------------------------------------------------------------------

ROOT          := $(CURDIR)
SUBMODULE     := $(ROOT)/cv-templates/Awesome-PhD-CV
CV_TEMPLATE   := $(SUBMODULE)/research-cv
RES_TEMPLATE  := $(SUBMODULE)/deedy-format

OUT_DIR       := $(ROOT)/assets/pdf

CV_SRC_DIR    := $(ROOT)/cv
RES_SRC_DIR   := $(ROOT)/resume

# Deedy's class file references fonts/ via a *relative* path
# (Path = fonts/lato/ inside the .cls), so fontspec resolves it from
# the working directory rather than via TEXINPUTS. We symlink the
# bundled fonts into resume/fonts/ so xelatex can find them.
RES_FONTS_LINK := $(RES_SRC_DIR)/fonts

XELATEX       := xelatex -interaction=nonstopmode -halt-on-error

.PHONY: all cv resume clean check-submodule

all: cv resume

check-submodule:
	@if [ ! -f "$(CV_TEMPLATE)/awesome-cv.cls" ]; then \
		echo "Submodule missing -- run: git submodule update --init --recursive"; \
		exit 1; \
	fi
	@if [ ! -f "$(RES_TEMPLATE)/deedy-resume-openfont.cls" ]; then \
		echo "Submodule missing -- run: git submodule update --init --recursive"; \
		exit 1; \
	fi

# Symlink the Deedy fonts into resume/ so fontspec's relative Path resolves.
$(RES_FONTS_LINK): check-submodule
	@if [ ! -e "$(RES_FONTS_LINK)" ]; then \
		ln -s ../cv-templates/Awesome-PhD-CV/deedy-format/fonts $(RES_FONTS_LINK); \
		echo "Linked $(RES_FONTS_LINK) -> ../cv-templates/Awesome-PhD-CV/deedy-format/fonts"; \
	fi

cv: check-submodule | $(OUT_DIR)
	@echo "Building CV (Awesome-CV format)..."
	cd $(CV_SRC_DIR) && \
		TEXINPUTS=".:$(CV_TEMPLATE):" \
		$(XELATEX) cv.tex && \
		TEXINPUTS=".:$(CV_TEMPLATE):" \
		$(XELATEX) cv.tex
	cp $(CV_SRC_DIR)/cv.pdf $(OUT_DIR)/cv.pdf
	@echo "Wrote $(OUT_DIR)/cv.pdf"

resume: check-submodule $(RES_FONTS_LINK) | $(OUT_DIR)
	@echo "Building Resume (Deedy format)..."
	cd $(RES_SRC_DIR) && \
		TEXINPUTS=".:$(RES_TEMPLATE):" \
		$(XELATEX) resume.tex && \
		TEXINPUTS=".:$(RES_TEMPLATE):" \
		$(XELATEX) resume.tex
	cp $(RES_SRC_DIR)/resume.pdf $(OUT_DIR)/resume.pdf
	@echo "Wrote $(OUT_DIR)/resume.pdf"

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

clean:
	@echo "Cleaning LaTeX intermediates..."
	cd $(CV_SRC_DIR)  && rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
	cd $(RES_SRC_DIR) && rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz

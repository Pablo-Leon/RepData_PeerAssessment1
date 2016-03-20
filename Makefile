
F_MAKEFILE=Makefile


RMDFILE=PA1_template
SOURCE_FILES=Makefile $(RMDFILE).Rmd PA1_lib.R
OUTPUT_FILES=$(RMDFILE).html

ZIP_FILES=activity.zip
DATA_FILES=activity.csv

all: $(OUTPUT_FILES)

$(RMDFILE).html: $(DATA_FILES)

.PHONY: all clean heads bkp

.SUFFIXES: .Rmd .html

.Rmd.html:	
	Rscript -e "rmarkdown::render('$(RMDFILE).Rmd')"

# .Rmd.html:	
# 	echo "require(knitr);\
# 	require(markdown);\
# 	knit('$(RMDFILE).Rmd', '$(RMDFILE).md');\
# 	markdownToHTML('$(RMDFILE).md', '$(RMDFILE).html', options=c('use_xhtml', 'base64_images'));\
# 	" > tmp.Rmd2Html.R
# 	Rscript tmp.Rmd2Html.R

# #	browseURL(paste('file://', file.path(getwd(),'$(RMDFILE).html'), sep=''))\

hello:
	echo "Hello!"

echo-sym:
	echo "F_MAKEFILE:$(F_MAKEFILE)"

clean: bkp
	rm *.trc tmp.Rmd2Html.R $(OUTPUT_FILES)

clean-all: clean
	rm $(DATA_FILES)

bkp:
	bak.pl $(SOURCE_FILES) *.R *.Rmd Makefile


$(DATA_FILES) : $(ZIP_FILES)
	unzip $(ZIP_FILES)
	touch $(DATA_FILES)

browse:
	google-chrome $(RMDFILE).html


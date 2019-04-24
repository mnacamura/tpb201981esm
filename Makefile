NAME := report

$(NAME).pdf: $(NAME).Rmd
	Rscript -e "rmarkdown::render('$(NAME).Rmd')"

DEFAULT: $(NAME).pdf

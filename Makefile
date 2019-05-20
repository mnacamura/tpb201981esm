NAME := supinfo2

$(NAME).pdf: $(NAME).Rmd
	Rscript -e "rmarkdown::render('$(NAME).Rmd')"

DEFAULT: $(NAME).pdf

clean:
	@rm $(NAME).pdf

PHONY: clean

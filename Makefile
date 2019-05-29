SRC := supinfo2
MAIN := appendix_s1

$(SRC).pdf: $(SRC).Rmd
	Rscript -e "rmarkdown::render('$(SRC).Rmd')"

$(MAIN).pdf: $(SRC).pdf
	cpdf $< -range 1-3 -o $@

table_1.pdf: $(SRC).pdf
	cpdf $< -range 4 -o $@

table_2.pdf: $(SRC).pdf
	cpdf $< -range 5 -o $@

DEFAULT: $(MAIN).pdf table_1.pdf table_2.pdf

clean:
	@rm $(SRC).pdf

PHONY: clean

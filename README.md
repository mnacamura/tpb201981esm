# Source code for Appendix S1 of Nakamura _et al._ "The popularity spectrum applied to a cross-cultural question"

This is the source code of Appendix S1 in the paper titled "The popularity
spectrum applied to a cross-cultural question", co-authored by Mitsuhiro Nakamura,
Joe Yuichiro Wakano, Kenichi Aoki, and Yutaka Kobayashi.

The main code is located in [`src.Rmd`](./src.Rmd), an [R
Markdown](https://rmarkdown.rstudio.com/) document in which all things including
computing Bayesian MCMC and visualizing the results are done.

The PDF document of the appendix (`appendix_s1.pdf`) will be generated by
compiling the R Markdown document. Below you can find the details of how to
compile the document.

## Install dependencies

### Using Nix

The easiest way to install all dependencies for compiling this appendix is to
use [Nix package manager](https://nixos.org/nix/) and
[direnv](https://github.com/direnv/direnv/).
To install Nix to your environment, see [their
instruction](https://nixos.org/nix/manual/#chap-quick-start).

You can install direnv by using Nix:

```sh
> nix-env -f '<nixpkgs>' -i direnv
```

After installing direnv, follow
[the instruction](https://github.com/direnv/direnv#setup).
Then, just typing

```sh
> direnv allow<ENTER>
```

in this directory starts installing the dependencies.

### Install manually

You need [R](https://www.r-project.org/) (and a number of R packages),
[pandoc](https://pandoc.org/),
[pandoc-citeproc](https://github.com/jgm/pandoc-citeproc/),
[TeX Live](https://www.tug.org/texlive/),
[cpdf](https://www.coherentpdf.com/), and
[GNU Make](https://www.gnu.org/software/make/).

Required R packages:

- doParallel
- dplyr
- ggplot2
- glue
- kableExtra
- magrittr
- purrr
- readr
- rmarkdown
- rstan
- stringr
- tibble
- tidyr

## Compile the document

Use `make`:

```sh
> make
```

Alternatively, you can do it explicitly:

```sh
> Rscript -e "rmarkdown::render('src.Rmd')"
> cpdf src.pdf -range 1-3 -o appendix_s1.pdf
```

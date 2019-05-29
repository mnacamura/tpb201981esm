with import <nixpkgs> {};

mkShell {
  buildInputs = [
    R
    gettext
  ] ++ (with rPackages; [
    doParallel
    dplyr
    ggplot2
    glue
    kableExtra
    magrittr
    purrr
    readr
    rmarkdown
    rstan
    stringr
    tibble
    tidyr
  ]) ++ (with haskellPackages; [
    pandoc
    pandoc-citeproc
  ]) ++ [
    ocamlPackages.cpdf
    xsv
    (texlive.combine {
      inherit (texlive)
      scheme-basic  # installs collection-{basic,latex}
      collection-latexrecommended
      collection-latexextra
      collection-fontsrecommended
      ulem
      ;
    })
  ];

  LANG = "C";

  shellHook = ''
  '';
}

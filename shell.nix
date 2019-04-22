with import <nixpkgs> {};

mkShell {
  buildInputs = [
    R which
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
    tibble
    tidyr
  ]) ++ (with haskellPackages; [
    pandoc
    # pandoc-citeproc
  ]) ++ [
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

  shellHook = ''
  '';
}

with import <nixpkgs> {};

mkShell {
  buildInputs = [
    R which
  ] ++ (with rPackages; [
    doParallel
    dplyr
    ggplot2
    glue
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
  ];

  shellHook = ''
  '';
}

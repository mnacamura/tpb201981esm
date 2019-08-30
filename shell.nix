let
  nixpkgs = fetchNixpkgs {
    rev = "282041fb7b2cc0fcc031cedfd66b2fbf880fa6ee";
    sha256 = "1lr1xg9k989xn6zci06p45jrv0izsyxwsd3hrvf2cazbxr0ihkgm";
  };

  fetchNixpkgs = { rev, sha256 }:
  builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };
in

with import nixpkgs {};

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
    gnumake
    ocamlPackages.cpdf
    # xsv
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

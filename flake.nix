{
  description = "AOC";

  outputs = { self, nixpkgs }: 
  let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in
  {
    devShell."x86_64-linux" = pkgs.mkShell {
      buildInputs = with pkgs; [
        haskellPackages.ghc
        ruby_3_0

        rustc
        rustfmt
        cargo # I prolly don't need this
        rust-analyzer
      ];
    };
  };
}

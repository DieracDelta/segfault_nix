{
  description = "this segfaults";
  inputs.nixpkgs.url = "nixpkgs/nixos-20.09";
  inputs.segfaults = {
    url = "git+file:.";
    flake = false;
  };

  outputs = inputs@{self, segfaults, nixpkgs}:
  let
    segfaults = (import nixpkgs { localSystem = "x86_64-linux";}).stdenv.mkDerivation {
      src = segfaults;
      name = "segfault";
    };
  in
    {
      packages.x86_64-linux.segfaults = segfaults;
    };


}

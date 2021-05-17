{
  description = "this segfaults";
  inputs.nixpkgs.url = "nixpkgs/master";
  inputs.segfaults = {
    url = "git+file:./.";
    flake = false;
  };

  outputs = inputs@{self, segfaults, nixpkgs}:
  let
    segfaults = nixpkgs.stdenv.mkderivation {
      name = "segfault";
      src = segfaults;
    };
  in
    {
      packages.x86_64-linux.segfaults = segfaults;
    };


}

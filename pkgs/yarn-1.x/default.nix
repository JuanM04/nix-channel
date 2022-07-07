{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "yarn";
  version = "1.22.19";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/${name}/-/${name}-${version}.tgz";
    sha512 = "/0V5q0WbslqnwP91tirOvldvYISzaqhClxzyUKXYxs07yUILIs5jx/k6CFe8bvKSkds5w+eiOqta39Wk3WxdcQ==";
  };
  doCheck = true;
  phases = "installPhase";
  installPhase = ''
    mkdir $out
    cp -r * $out
    chmod +x $out/bin/{yarn,yarnpkg}
  '';
}
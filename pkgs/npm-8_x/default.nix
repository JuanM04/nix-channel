# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "npm";
  version = "8.19.4";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/npm/-/npm-8.19.4.tgz";
    sha512 = "3HANl8i9DKnUA89P4KEgVNN28EjSeDCmvEqbzOAuxCFDzdBZzjUl99zgnGpOUumvW5lvJo2HKcjrsc+tfyv1Hw==";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    chmod +x $out/bin/{npm,npx,node-gyp-bin/node-gyp}
  '';
  meta.priority = "100"; # Prevents collision with Node's built-in npm
}

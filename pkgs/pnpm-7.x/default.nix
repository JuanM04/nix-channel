{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "pnpm";
  version = "7.5.0";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/${name}/-/${name}-${version}.tgz";
    sha512 = "sb9wJNyx/d8l3Gze2jI1y8BGNbb/ga+JT3SrGNiH+C5KbtZ4wmgePBWGjaiGugcpT9+vQ5MO//+QlVWhMCpedQ==";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    mv $out/bin/pnpm.cjs $out/bin/pnpm
    mv $out/bin/pnpx.cjs $out/bin/pnpx
    chmod +x $out/bin/{pnpm,pnpx}
  '';
}
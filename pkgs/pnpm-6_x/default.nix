{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "pnpm";
  version = "6.33.0";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/${name}/-/${name}-${version}.tgz";
    sha512 = "BytlfB6lpU6kqoqVORIxVbPsRQ+9nLrugJUXorpOhB6XsCyXOYR9w+2Rf6cGGoLVUaMfzzSbHnMgxfgTg8KxyA==";
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
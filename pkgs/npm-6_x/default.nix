{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "npm";
  version = "6.14.17";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/${name}/-/${name}-${version}.tgz";
    sha512 = "CxEDn1ydVRPDl4tHrlnq+WevYAhv4GF2AEHzJKQ4prZDZ96IS3Uo6t0Sy6O9kB6XzqkI+J00WfYCqqk0p6IJ1Q==";
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
import { getLatestVersion } from "../../scripts/registry.ts";

const { version, url, sha512 } = await getLatestVersion("yarn", "1.x");

console.log("Latest version of Yarn:", version);

Deno.writeTextFile(
  new URL("./default.nix", import.meta.url),
  `# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "yarn";
  version = "${version}";
  src = pkgs.fetchurl {
    url = "${url}";
    sha512 = "${sha512}";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    chmod +x $out/bin/{yarn,yarnpkg}
  '';
}
`
);

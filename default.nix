{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

let
    allPkgs = pkgs // railwayPkgs;

    callPackage = path: overrides:
        let f = import path;
        in f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);

    railwayPkgs = with pkgs; {
      "npm-6.x" = callPackage ./pkgs/npm-6.x { };
      "npm-8.x" = callPackage ./pkgs/npm-8.x { };
      "pnpm-6.x" = callPackage ./pkgs/pnpm-6.x { };
      "pnpm-7.x" = callPackage ./pkgs/pnpm-7.x { };
      "yarn-1.x" = callPackage ./pkgs/yarn-1.x { };
    };
in railwayPkgs
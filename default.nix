self: super:

{
  "npm-6.x" = super.callPackage ./pkgs/npm-6.x { };
  "npm-8.x" = super.callPackage ./pkgs/npm-8.x { };
  "pnpm-6.x" = super.callPackage ./pkgs/pnpm-6.x { };
  "pnpm-7.x" = super.callPackage ./pkgs/pnpm-7.x { };
  "yarn-1.x" = super.callPackage ./pkgs/yarn-1.x { };
}
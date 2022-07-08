import * as semver from "https://deno.land/x/semver@v1.4.0/mod.ts";

type Versions = Record<
  string,
  {
    dist: {
      tarball: string;
      integrity: string;
    };
  }
>;

export async function getLatestVersion(packageName: string, condition: string) {
  const registry = await fetch(
    `https://registry.npmjs.org/${packageName}`
  ).then((res) => res.json());
  const versions = registry.versions as Versions;
  const sortedVersions = Object.keys(versions).sort((a, b) =>
    semver.gt(a, b) ? -1 : 1
  );

  for (const version of sortedVersions) {
    if (semver.satisfies(version, condition)) {
      return {
        version,
        url: versions[version].dist.tarball,
        sha512: versions[version].dist.integrity.slice("sha512-".length),
      };
    }
  }

  throw new Error(
    `Couldn't find a version of ${packageName} that satisfies ${condition}`
  );
}

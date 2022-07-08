import { maxSatisfying } from "https://deno.land/x/semver@v1.4.0/mod.ts";

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
  const latest = maxSatisfying(Object.keys(versions), condition);

  if (!latest) {
    throw new Error(
      `Couldn't find a version of ${packageName} that satisfies ${condition}`
    );
  }

  return {
    version: latest,
    url: versions[latest].dist.tarball,
    sha512: versions[latest].dist.integrity.slice("sha512-".length),
  };
}

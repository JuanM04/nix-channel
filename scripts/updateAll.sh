#!/bin/bash

# Run all the update.ts under the pkgs/ folder
for f in pkgs/**/update.ts; do
  deno run --allow-net --allow-write "$f"
done
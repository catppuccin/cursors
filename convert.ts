#!/usr/bin/env -S deno run -A

import $, { PathRef } from "https://deno.land/x/dax@0.35.0/mod.ts";
import * as ini from "https://deno.land/std@0.209.0/ini/mod.ts";
import * as path from "https://deno.land/std@0.209.0/path/windows/mod.ts";

// $.setPrintCommand(true);

const cursors = [
  "default.cur", // Normal Select
  "help.cur", // Help Select
  "progress.ani", // Working in Background
  "wait.ani", // Busy
  "cross.cur", // Precision Select
  "text.cur", // Text Select
  "pencil.cur", // Handwriting
  "not-allowed.cur", // Unavailable
  "ns-resize.cur", // Vertical Resize
  "ew-resize.cur", // Horizontal Resize
  "nwse-resize.cur", // Diagonal Resize 1
  "nesw-resize.cur", // Diagonal Resize 2
  "all-scroll.cur", // Move
  "up-arrow.cur", // Alternate Select
  "pointer.cur", // Link Select
  "", // Location Select
  "", // Person Select
];

async function processFolder(baseDir: PathRef | string) {
  baseDir = $.path(baseDir);

  if (!(await baseDir.exists())) throw new Deno.errors.NotFound();

  const schemeName = baseDir.basename().split("-").slice(0, -1).join(" ");
  const inDir = baseDir.join("cursors");
  const outDir = baseDir.join("win");
  await outDir.emptyDir();

  const inFiles = cursors
    .filter(Boolean)
    .map((v) => path.basename(v, path.extname(v)))
    .map((v) => inDir.join(v));
  await $`python -m pipx run x2wincur ${inFiles} -o ${outDir}`;

  const cursorDir = path.join("Cursors", ...schemeName.split(" "));
  const regCursors = cursors
    .map((v) => v && path.join("%SYSTEMROOT%", cursorDir, v))
    .join(",");

  const inf = {
    Version: { signature: "$CHICAGO$" },
    DefaultInstall: {
      CopyFiles: "Scheme.Cur, Scheme.Txt",
      AddReg: "Scheme.Reg",
    },
    DestinationDirs: {
      "Scheme.Cur": `10,"${cursorDir}"`,
      "Scheme.Txt": `10,"${cursorDir}"`,
    },
    "Scheme.Reg": [
      `HKCU,"Control Panel\\Cursors\\Schemes","${schemeName}",0x00020000,"${regCursors}"`,
    ],
    "Scheme.Cur": cursors.filter(Boolean),
  };

  outDir.join("install.inf").writeText(ini.stringify(inf));
}

if (import.meta.main) {
  const dirs = [...$.path("cursors").readDirSync()]
    .filter((v) => v.isDirectory)
    .map((v) => v.path);

  const pb = $.progress("Converting", {
    length: dirs.length,
  });
  for (const dir of dirs) {
    const name = dir.basename().replaceAll("-", " ");
    pb.message(name);
    // await $.sleep("0.5s");
    await processFolder(dir);
    pb.increment();
  }
  pb.finish();
}

from configparser import ConfigParser
from pathlib import Path, PureWindowsPath
import shutil
from win2xcur.parser import open_blob
from win2xcur.writer import to_smart

cursors = [
    "default.cur", # Normal Select
    "help.cur", # Help Select
    "progress.ani", # Working in Background
    "wait.ani", # Busy
    "cross.cur", # Precision Select
    "text.cur", # Text Select
    "pencil.cur", # Handwriting
    "not-allowed.cur", # Unavailable
    "ns-resize.cur", # Vertical Resize
    "ew-resize.cur", # Horizontal Resize
    "nwse-resize.cur", # Diagonal Resize 1
    "nesw-resize.cur", # Diagonal Resize 2
    "all-scroll.cur", # Move
    "up-arrow.cur", # Alternate Select
    "pointer.cur", # Link Select
    "", # Location Select
    "", # Person Select
]

def processFolder(baseDir):
    if not baseDir.exists():
        raise "Folder not found"

    schemeName = Path(baseDir).name.split("-")[0:-1];
    schemeName = " ".join(schemeName)
    inDir = baseDir / "cursors";
    outDir = baseDir / "win";

    if outDir.exists():
        shutil.rmtree(outDir)
    outDir.mkdir()

    inFiles = list(filter(bool, cursors))
    inFiles = [Path(v).stem for v in inFiles]
    inFiles = [inDir / v for v in inFiles]

    for file in inFiles:
        blob = file.open('rb').read()
        cursor = open_blob(blob)
        ext, result = to_smart(cursor.frames)
        output = outDir / (file.name + ext)
        with open(output, 'wb') as f:
            f.write(result)

    cursorDir = PureWindowsPath("Cursors").joinpath(*schemeName.split(" "))
    regCursors = [v and PureWindowsPath("%SYSTEMROOT%") / cursorDir / v for v in cursors]
    regCursors = ",".join([str(v) for v in regCursors])

    schemeCur = list(filter(bool, cursors))
    schemeCur = {i: v for i, v in enumerate(schemeCur)}

    inf = ConfigParser(interpolation = None)
    inf.read_dict({
        "Version": { "signature": "$CHICAGO$" },
        "DefaultInstall": {
            "CopyFiles": "Scheme.Cur, Scheme.Txt",
            "AddReg": "Scheme.Reg",
        },
        "DestinationDirs": {
            "Scheme.Cur": f'10,"{cursorDir}"',
            "Scheme.Txt": f'10,"{cursorDir}"',
        },
        "Scheme.Reg": {
           0: f'HKCU,"Control Panel\\Cursors\\Schemes","{schemeName}",0x00020000,"{regCursors}"',
        },
        "Scheme.Cur": schemeCur
    })
    with open(outDir / "install.inf", "w") as configfile:
        inf.write(configfile)

if __name__ == "__main__":
    dirs = list(Path("cursors").iterdir())
    dirs = [v for v in dirs if v.is_dir()]
    for dir in dirs:
        name = dir.name.replace('-', ' ')
        print("Converting", name)
        processFolder(dir)

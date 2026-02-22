# CAD Projects — Claude Instructions

## Toolchain
- **Modeling**: OpenSCAD (flatpak `org.openscad.OpenSCAD 2021.01`)
- **Slicer / Viewer**: Bambu Studio (flatpak `com.bambulab.BambuStudio`)
- No Python toolchain — pure OpenSCAD

## Directory Layout
```
models/     ← .scad source files
exports/    ← generated .stl / .step / .3mf (gitignored)
```

## Workflow
1. Create or edit a model in `models/`
2. Export to STL via OpenSCAD CLI
3. Preview in Bambu Studio via `/bambu`

## Skills
- `/scad-new <path>` — scaffold a new `.scad` file with standard parametric boilerplate
- `/bambu [path]` — open an STL/3MF/OBJ in Bambu Studio (defaults to most recent export)

## Useful Commands

Export a `.scad` file to STL:
```bash
flatpak run org.openscad.OpenSCAD --render -o exports/<name>.stl models/<name>.scad
```

Open a file in Bambu Studio:
```bash
flatpak run com.bambulab.BambuStudio exports/<name>.stl &
```

## OpenSCAD Notes
- `$fn = 64` is the standard resolution
- Vertical fillets + horizontal chamfers: use `intersection()` of `linear_extrude(offset(...))` and `hull()` of nested cuboids
- Internal threads: `rotate_extrude()` of a sawtooth `polygon()` profile
- Units: mm; X = width, Y = depth, Z = print direction (up)

/* =================================================================
   test_cube.scad  —  simple test model for render skill validation
   =================================================================
   Units : mm
   Coords: X = width, Y = depth/height, Z = print direction
   ================================================================= */

// ── Parameters ────────────────────────────────────────────────────
size       = 40;    // outer cube side length (mm)
hole_d     = 15;    // through-hole diameter (mm)
fillet_r   = 4;     // corner rounding radius (mm)
chamfer_s  = 2;     // top/bottom chamfer size (mm)

// ── Resolution ────────────────────────────────────────────────────
$fn = 64;

// ── Derived values ────────────────────────────────────────────────
hole_r = hole_d / 2;

// ── Modules ───────────────────────────────────────────────────────
module rounded_box(s, r, ch) {
    intersection() {
        linear_extrude(s, center = true)
            offset(r = r)
                square([s - 2*r, s - 2*r], center = true);
        hull() {
            cube([s,        s,        s - 2*ch], center = true);
            cube([s - 2*ch, s - 2*ch, s       ], center = true);
        }
    }
}

// ── Assembly ──────────────────────────────────────────────────────
difference() {
    rounded_box(size, fillet_r, chamfer_s);
    cylinder(h = size + 1, r = hole_r, center = true);
}

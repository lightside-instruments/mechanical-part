import FreeCAD as App
import Part
import PartDesignGui

doc = App.newDocument("jedec_matrix_tray")

# Base JEDEC Outer Profile Constraints
length = 322.6
width = 135.9
thickness = 6.35

# Component Grid Customization (Change these to match your IC size)
rows = 4
cols = 6
pocket_w = 18.0  # Width of chip pocket
pocket_l = 27.0  # Length of chip pocket
pocket_d = 5.5   # Depth of chip pocket
pitch_x = 45.0   # Horizontal distance between pocket centers
pitch_y = 30.0   # Vertical distance between pocket centers

# 1. Create Tray Body
box = Part.makeBox(length, width, thickness)

# 2. Add Pin 1 45-degree corner Chamfer (Standard JEDEC feature)
# Chamfering the bottom-left corner edge
box = box.makeChamfer(5.0, [box.Edges[0]]) 

# 3. Create Pocket Matrix Array
pockets = []
start_x = (length - ((cols - 1) * pitch_x)) / 2
start_y = (width - ((rows - 1) * pitch_y)) / 2

for r in range(rows):
    for c in range(cols):
        px = start_x + (c * pitch_x) - (pocket_l / 2)
        py = start_y + (r * pitch_y) - (pocket_w / 2)
        pz = thickness - pocket_d
        
        # Build individual pocket tool definitions
        p_box = Part.makeBox(pocket_l, pocket_w, pocket_d + 1)
        p_box.translate(App.Vector(px, py, pz))
        pockets.append(p_box)

        # Add pocket for the L
        c_offset_x=21 # 37-16
        c_offset_y=8 # 57-49
        c_l=7
        c_w=7
        c_d = 6.35
        cz=thickness - c_d
        c_box = Part.makeBox(c_l, c_w, c_d + 1)
        c_box.translate(App.Vector(px+c_offset_x-c_l/2, py+c_offset_y-c_w/2, cz))
        pockets.append(c_box)

# Compound all pockets and subtract from the main body
all_pockets = Part.makeCompound(pockets)
jedec_tray = box.cut(all_pockets)

# Show inside FreeCAD
Part.show(jedec_tray, "jedec_tray_base")
App.ActiveDocument.recompute()


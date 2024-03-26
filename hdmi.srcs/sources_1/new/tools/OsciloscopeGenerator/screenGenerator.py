from PIL import Image, ImageFont, ImageDraw
import numpy as np
import datetime

import fontToPng as ftp

# characters parameters
FONT_SIZE = 30
MAX_PADDING = 0

font_path = "PixelOperator8.ttf"
font_object = ImageFont.truetype(font_path, FONT_SIZE)  # Font has to be a .ttf file

fg = "#FFFF00"  # yellow foreground
bg = "#000000"  # black background

threshold = 100
img_name = "backgroundV2.jpg"
package_name = "font_pkg"
img = Image.open(img_name)

# Grayscale
img = img.convert('L')
# Threshold
img = img.point(lambda p: 255 if p > threshold else 0)
# To mono
img = img.convert('1')
# To rgb
img = img.convert("RGB")

colors = img.getbands()

arr = np.array(img)
img_size = arr.shape
print(img_size)

unique_colors = set()
for i in range(img.size[0]):
    for j in range(img.size[1]):
        pixel = img.getpixel((i, j))
        unique_colors.add(pixel)

unique_colors = list(unique_colors)

print(unique_colors)

comment = f'''------------------------------------------------------------------------------------------------
-- File generated automatically using python script. Do not edit it by hand!
-- Generated using: screenGenerator.py and fontToPng.py
-- Generation time: {datetime.date.today()}
-- Background generated with image named: {img_name}
-- Font name: {font_path}
-- Package name: {package_name}
------------------------------------------------------------------------------------------------

'''

libraries = '''library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;\n
'''

typedef = f'''constant IMG_HEIGHT : natural := {img_size[0]};
constant IMG_WIDTH : natural := {img_size[1]};
constant FONT_HEIGHT : natural := {ftp.FONT_SIZE + 2};
constant FONT_WIDTH : natural := {ftp.FONT_SIZE + 4};
type t_img is array(0 to IMG_HEIGHT - 1, 0 to IMG_WIDTH - 1) of integer range 0 to {len(unique_colors)-1};
type t_font is array (0 to FONT_HEIGHT - 1, 0 to FONT_WIDTH - 1) of integer range 0 to {len(unique_colors)-1};\n'''

with open(f"{package_name}.vhd", "w") as file:
    file.write(comment)
    file.write(libraries)
    file.write(f"package {package_name} is\n\n")
    file.write("-- unique colors are:\n")
    for i in range(0, len(unique_colors)):
        file.write(f"-- {i}: {unique_colors[i]}\n")

    file.write("\n")
    type_comment = '''------------------------------------------------------------------------------------------------
-- TYPES DECLARATIONS
------------------------------------------------------------------------------------------------\n
'''
    file.write(type_comment)
    file.write(typedef)

    function_comment = '''
------------------------------------------------------------------------------------------------
-- FUNCTION DECLARATIONS
------------------------------------------------------------------------------------------------\n
'''
    file.write(function_comment)
    # file.write("-- function returning RGB value of a selected pixel\n")
    # file.write("function BG_getPixelColor(column : natural; row : natural) return std_logic_vector;\n")

    function_comment = '''
------------------------------------------------------------------------------------------------
-- CONSTANTS
------------------------------------------------------------------------------------------------
'''

    file.write(function_comment)
    file.write("-- constant containing background\n")
    file.write("constant BACKGROUND : t_img := (\n")

    print(img.size[0], img.size[1])

    for i in range(img.size[1]):
        file.write("(")
        for j in range(img.size[0]):
            pixel = img.getpixel((j, i))
            color_id = unique_colors.index(pixel)
            if j < img.size[0] - 1:
                file.write(f"{color_id}, ")
            else:
                file.write(f"{color_id}")
        if i < img.size[1] - 1:
            file.write(f"),\n")
        else:
            file.write(f")\n")
    file.write(");\n\n")

    for i in [chr(x) for x in range(32, 127)]:
        ftp.generate_character(i, file, unique_colors)

    file.write("end package;\n\n")

    file.write(f"package body {package_name} is\n\n")

#     file.write("-- function returning RGB value of a selected pixel\n")
#     file.write(f'''function BG_getPixelColor(column : natural; row : natural) return std_logic_vector is
#     variable output : std_logic_vector(23 downto 0) := "000000000000000000000000";
# begin
#     if (row >= 0 and row < {img_size[0]}) and (column >= 0 and column < {img_size[1]}) then
#         if BACKGROUND(row, column) = 0 then
#             output := "{"{:08b}".format(unique_colors[0][0])}{"{:08b}".format(unique_colors[0][1])}{"{:08b}".format(unique_colors[0][2])}";
# ''')
#     for i in range(1, len(unique_colors)):
#         file.write(f'''        elsif BACKGROUND(row, column) = 1 then
#             output := "{"{:08b}".format(unique_colors[i][0])}{"{:08b}".format(unique_colors[i][1])}{"{:08b}".format(unique_colors[i][2])}";
# ''')
#     file.write('''        end if;
#     end if;
#     return output;
# end function;\n''')

    file.write(f"end package body;\n")




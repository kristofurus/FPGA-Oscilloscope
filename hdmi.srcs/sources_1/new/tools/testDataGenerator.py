import numpy as np
from PIL import Image


# script generating 8bit code with control signals from example image

# --                        VGA        SVGA        HD720        HD1080
# ---------------------------------------------------------------------
# -- Horizontal
# -- Active Pixels          640         800         1280          1920
# -- Front Porch             16          40          110            88
# -- Sync Width              96         128           40            44
# -- Back Porch              48          88          220           148
# -- Blanking Total         160         256          370           280
# -- Total Pixels           800        1056         1650          2200
# -- Sync Polarity          neg         pos          pos           pos
# ---------------------------------------------------------------------
# -- Vertical
# -- Active Lines           480         600          720          1080
# -- Front Porch             10           1            5             4
# -- Sync Width               2           4            5             5
# -- Back Porch              33          23           20            36
# -- Blanking Total          45          28           30            45
# -- Total Lines            525         628          750          1125
# -- Sync Polarity          neg         pos          pos           pos
# -- Active Pixels      307,200     480,000      921,600     2,073,600

img = Image.open("vga_test_image.JPG")
arr = np.array(img)

colors = img.getbands()
img_size = arr.shape

draw_en = False
ctrl = 0
r_data = 0
g_data = 0
b_data = 0

h_sync = 0
v_sync = 0

print(img_size)

with open("img.txt", "w") as file:
    # file.write("")
    pass

# assume picture is in VGA
# there are 525 vertical lines
for v in range(0, 525):
    # and 800 horizontal lines
    for h in range(0, 800):
        # default values
        draw_en = False
        ctrl = 0b11
        r_data = 0
        g_data = 0
        b_data = 0

        if (48 <= h < 48 + 640) and (33 <= v < 33 + 480):
            draw_en = True
            r_data = arr[v - 33][h - 48][0]
            g_data = arr[v - 33][h - 48][0]
            b_data = arr[v - 33][h - 48][0]
            # ctrl = 0b11
        elif h >= 704 and v >= 523:
            ctrl = 0b00
        elif h >= 704:
            ctrl = 0b10
        elif v >= 523:
            ctrl = 0b01

        with open("img.txt", "a") as file:
            line = ("1" if draw_en else "0") + "\t" + str(ctrl) + "\t" + str(r_data) + "\t" + str(g_data) + "\t" \
                   + str(b_data) + "\n"
            file.write(line)


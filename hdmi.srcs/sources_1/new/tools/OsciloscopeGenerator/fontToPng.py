from PIL import Image, ImageFont, ImageDraw

# characters parameters
FONT_SIZE = 30
MAX_PADDING = 0

font_path = "PixelOperator8.ttf"
font_object = ImageFont.truetype(font_path, FONT_SIZE)  # Font has to be a .ttf file

fg = "#FFFFFF"  # yellow foreground
bg = "#000000"  # black background

threshold = 125


def generate_character(character, file, colors):
    # text_width, text_height = font_object.getsize(character)
    image = Image.new('RGB', (FONT_SIZE + 4, FONT_SIZE + 2), color=bg)
    draw_pad = ImageDraw.Draw(image)
    draw_pad.text((MAX_PADDING, MAX_PADDING), character, font=font_object, fill=fg)
    # Grayscale
    image = image.convert('L')
    # Threshold
    image = image.point(lambda p: 255 if p > threshold else 0)
    # To mono
    image = image.convert('1')
    image = image.convert("RGB")
    if character.isalnum():
        if character.isupper():
            file.write(f"constant CHARACTER_{character}_upper : t_font := (\n")
        else:
            file.write(f"constant CHARACTER_{character} : t_font := (\n")
    else:
        file.write(f"constant CHARACTER_{ord(character)} : t_font := (\n")
    for i in range(image.size[1]):
        file.write("(")
        for j in range(image.size[0]):
            pixel = image.getpixel((j, i))
            color_id = colors.index(pixel)
            if j < image.size[0] - 1:
                file.write(f"{color_id}, ")
            else:
                file.write(f"{color_id}")
        if i < image.size[1] - 1:
            file.write(f"),\n")
        else:
            file.write(f")\n")
    file.write(");\n\n")



# for i in [chr(x) for x in range(32, 127)]:
#     text_width, text_height = font_object.getsize(i)
#     img = Image.new('RGB', (text_width, FONT_SIZE+2), color=bg)
#     draw_pad = ImageDraw.Draw(img)
#     draw_pad.text((MAX_PADDING, MAX_PADDING), i, font=font_object, fill=fg)
#
#     # Grayscale
#     img = img.convert('L')
#     # Threshold
#     img = img.point(lambda p: 255 if p > threshold else 0)
#     # To mono
#     img = img.convert('1')
#     # To rgb
#     img = img.convert("RGB")
#
#     file_name = f"characters/character_{ord(i)}.png"
#     img.save(file_name)

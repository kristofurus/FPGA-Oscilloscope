import numpy as np
from PIL import Image
import pandas as pd

# data = np.genfromtxt("decoded_rgb.csv", delimiter=";", dtype=np.dtype('B'))
#
# print(data.shape)
# print(data)
#
columns = ["R", "G", "B", "SYNC"]

df = pd.read_csv("decoded_rgb.csv", delimiter=";")

df.columns = columns
print(df)

filtered_df = df[(df["SYNC"] == 0)]
print(filtered_df)

rgb = filtered_df[["R", "G", "B"]]
print(rgb)

NUM_OF_FRAMES = 10

full = df[["R", "G", "B"]]
full = full.iloc[0:800*525*NUM_OF_FRAMES, :]
np_full = full.to_numpy(dtype=np.dtype('B'))
np_full = np.reshape(np_full, (-1, 800, 3), order='C')
print("full:")
print(np_full)
full_img = Image.fromarray(np_full)
full_img.save("FullImage.png")

# We know how big picture should be since we use VGA
single_frame = rgb.iloc[0:640*480*NUM_OF_FRAMES, :]
print(single_frame)

np_single = single_frame.to_numpy(dtype=np.dtype('B'))
print(np_single)

# reshape picture from vector to matrix
data = np.reshape(np_single, (-1, 640, 3), order='C')
print(data.shape)

img = Image.fromarray(data)

img.save("decodedImg.png")

# # We know how big picture should be since we use VGA
# single_frame2 = rgb.iloc[640*480:640*480*1, :]
# print(single_frame2)
#
# np_single2 = single_frame2.to_numpy(dtype=np.dtype('B'))
# print(np_single2)
#
# # reshape picture from vector to matrix
# data2 = np.reshape(np_single2, (480, 640, 3), order='C')
# print(data2.shape)
#
# img = Image.fromarray(data2)
#
# img.save("decodedImg2.png")

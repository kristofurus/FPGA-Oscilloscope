import numpy as np
from PIL import Image

data = np.genfromtxt("background.csv", delimiter=";", dtype=np.dtype('B'))

print(data.shape)
print(data)

data = np.reshape(data, (480, 640, 3), order='C')
print(data.shape)

img = Image.fromarray(data)

img.save("remadeImg.png")

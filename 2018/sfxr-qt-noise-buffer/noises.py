import random

import numpy as np
import matplotlib.pyplot as plt


X_LENGTH = 100
BUFFER_LENGTH = 32
X_AXIS_COLOR = '#cccccc'


def my_random():
    return random.random() * 2 - 1


class LowPitchGenerator:
    def __init__(self):
        self.buffer = [my_random() for x in range(BUFFER_LENGTH)]

    def __call__(self, x):
        idx = x / float(X_LENGTH + 1)
        return self.buffer[int(idx * BUFFER_LENGTH)]


x1 = np.linspace(0.0, X_LENGTH, X_LENGTH)

y1 = [my_random() for x in x1]


generator = LowPitchGenerator()
y2 = [generator(x) for x in x1]

plt.subplots_adjust(hspace=0.4)

plt.subplot(2, 1, 1)
plt.title('Long buffer')
line = plt.axhline()
line.set_c(X_AXIS_COLOR)
plt.plot(x1, y1)

plt.subplot(2, 1, 2)
plt.title('Stretched 32 item noise buffer')
line = plt.axhline()
line.set_c(X_AXIS_COLOR)
plt.plot(x1, y2)

plt.savefig('noises.png')

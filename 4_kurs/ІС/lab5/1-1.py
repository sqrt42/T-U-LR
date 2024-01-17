import numpy as np


def inclusion(a,b):
    return np.all(a < b)


def intersection(a, b):
    return np.minimum(a, b)


def negative(a):
    return np.abs(1-a)


def difference(a, b):
    return intersection(a, negative(b))


def union(a, b):
    return np.maximum(a, b)


a = np.abs(np.array([0.4, 0.1, 0.2, 1]))
b = np.abs(np.array([0.7, 0.1, 0.1, -0.1]))
c = np.abs(np.array([0.1, 0.9, 0, 1]))

print("B includes A?:", inclusion(a, b))
print("B-A:", difference(b, a))
print("A-C:", difference(a, c))
print("C intersection !A", difference(c, a))
print("B union !A", union(b, negative(a)))

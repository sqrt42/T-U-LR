import numpy as np


def composition(a,b):
    compArr = False
    for x in range(len(a)):
        tmpMax = []
        for z in range(len(b[0])):
            tmpMin = []
            for y in range(len(b)):
                tmpMin.append(min(a[x][y],b[y][z]))
            tmpMax.append(max(tmpMin))

        if not(compArr):
            compArr = tmpMax
        else:
            compArr = np.vstack([compArr, tmpMax])
    return compArr


a = np.abs(np.array([[-0.1, 0.7, 0.4],
                     [0.3, 0.1, 0.5]]))

b = np.abs(np.array([[0.5, 0.4, 1],
                    [0, 0.1, -0.2],
                    [1, 0, 0.7]]))

print(composition(a,b))
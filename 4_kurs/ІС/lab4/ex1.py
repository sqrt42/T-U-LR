import numpy as np
weights = np.array([[0.5, 0.7], [0.6, 0.2]])

X = np.array([1, 0])
D = np.array([0, 1])
learning_rate = 0.5


def linear_activation(x, k=0.6):
    return k * x


neuron1_output = linear_activation(np.dot(X, weights[0]))
neuron2_output = linear_activation(np.dot(X, weights[1]))

errors = D - np.array([neuron1_output, neuron2_output])

new_weights = weights - learning_rate * np.outer(errors, X)
weights = new_weights
print("Y1:", round(neuron1_output, 3))
print("Y2:", round(neuron2_output, 3))
print("E1:", round(errors[0], 3))
print("E2:", round(errors[1], 3))
print("Updated weights:")
print(round(weights[0, 0], 3), round(weights[1, 0], 3) )
print(weights[0, 1], weights[1, 1])
import numpy as np

weights_input = np.array([[0.5, 0.3], [0.4, 0.8]])
weights_output = np.array([0.8, 0.3])

print("\nSynaptic weights layer 1:")
print(weights_input)
print("\nSynaptic weight layer 2:")
print(weights_output)

X = np.array([0, 1])
D = np.array([1])
learning_rate = 0.5


def sigmoid(s):
    return 1 / (1 + np.exp(-s))


neuron1_output = sigmoid(np.dot(X, weights_input))
neuron2_output = sigmoid(np.dot(neuron1_output, weights_output))

er2_ = (D - neuron2_output) * neuron2_output * (1 - neuron2_output)
new_weights_output = weights_output - learning_rate * neuron1_output*er2_

er1_ = neuron1_output * (1 - neuron1_output) * er2_*weights_output

new_weights_input = weights_input + learning_rate * np.outer(X, er1_)
print("New weights layer 1")
print(new_weights_input)
print("New weights layer 2")
print(new_weights_output)

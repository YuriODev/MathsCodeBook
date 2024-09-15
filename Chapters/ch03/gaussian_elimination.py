import numpy as np

def gaussian_elimination(A, b):
    n = len(b)
    for i in range(n):
        A[i] = A[i] / A[i, i]  # Normalize pivot row
        for j in range(i + 1, n):
            A[j] = A[j] - A[j, i] * A[i]
    x = np.zeros(n)
    for i in range(n-1, -1, -1):
        x[i] = (b[i] - np.dot(A[i, i+1:], x[i+1:])) / A[i, i]
    return x

A = np.array([[2, 3, -1], [4, 1, 2], [-2, 7, 3]], dtype=float)
b = np.array([1, 2, 3], dtype=float)
solution = gaussian_elimination(A, b)
print("Solution:", solution)
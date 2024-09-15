import sympy as sp

# Define the variable and the function
x = sp.symbols('x')
f = x**3 - 3*x**2 + 2*x

# Differentiate the function
derivative = sp.diff(f, x)
print(f"The derivative of f(x) is: {derivative}")
import sympy as sp

# Define the variable and the quadratic equation
x = sp.symbols('x')
quadratic_eq = 2*x**2 - 4*x + 1

# Solve the quadratic equation
solutions = sp.solve(quadratic_eq, x)
print(f"The solutions to the quadratic equation are: {solutions}")

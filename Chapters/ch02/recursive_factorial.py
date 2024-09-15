def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

# Example usage
n = 5
print(f"Factorial of {n} is {factorial(n)}")

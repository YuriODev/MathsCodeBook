def fibonacci_dp(n):
    # Base cases
    if n == 0:
        return 0
    elif n == 1:
        return 1
    
    # Initialize table for dynamic programming
    dp = [0] * (n + 1)
    dp[1] = 1
    
    # Compute Fibonacci numbers iteratively
    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]
    
    return dp[n]

# Example usage
n = 10
print(f"Fibonacci number at position {n} is {fibonacci_dp(n)}")

def karatsuba(x, y):
    if x < 10 and y < 10
        return x * y

    n = max(len(str(x)), len(str(y)))

    m = 10 ** ((n + 1) // 2)

    x_1 = x // m # First half of x
    x_0 = x % m # Second half of x

    y_1 = y // m # First half of y
    y_0 = y % m # Second half of y

    # Recursive steps
    z_1 = karatsuba(x_1, y_1)
    z_2 = karatsuba(x_0, y_0)
    z_3 = karatsuba(x_1 + x_0, y_1 + y_0) - z_1 - z_2

    return z_1 * (m * m) + z_3 * p + z_2
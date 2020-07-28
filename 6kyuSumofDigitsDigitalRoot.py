def digital_root(n):
    dig = sum(int(i) for i in str(n))
    return dig if dig < 10 else digital_root(dig)
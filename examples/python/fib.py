import matplotlib.pyplot as plt
import numpy as np
from timeit import Timer

def fib_call(n):
    count = 0
    def fib(n):
        nonlocal count
        count += 1
        if n<2:
            return 1
        else:
            return fib(n-2)+fib(n-1)
    fib(n)
    return count

def pic_count():
    x = np.arange(0, 24, 1)
    y = np.array([fib_call(n) for n in x])
    fig = plt.figure()
    plt.plot(x, y)
    plt.title('Count of calls')
    plt.ylabel('Сount')
    plt.xlabel('n')
    plt.grid(True)
    plt.show()    

if __name__ == "__main__":
    pic_count()
    # count = 1
    # f = fib_call(4)
    # print(f)

'''
Получение персестановок для множества натуральных чисел 1..n
'''

def p_recusive(head, tail):
    if tail == []:
        return [head]
    result = []
    for item in tail:
        cut = tail.copy()
        cut.remove(item)
        for elem in p_recusive([], cut):
            result.append(head + [item] + elem)
    return result

def r_permutaion(n):        
    return p_recusive([], [elem+1 for elem in range(n)])

def i_permutaion(n):    
    items = [[1]]    
    for k in range(2, n+1):
        result = []   
        for item in items:
            for idx in range(len(item)+1):
                result.append(item[:idx]+[k]+item[idx:])
        items = result
    return items    

import matplotlib.pyplot as plt
import numpy as np
from timeit import Timer

def time(n): 
    t = Timer(lambda: i_permutaion(n))   
    return t.timeit(number=1)

def itemcount(n): 
    return len(i_permutaion(n))   

def pic_time():
    lag = 1
    x = np.arange(1, 10, lag)
    y = np.array([time(n) for n in x])
    fig = plt.figure()
    plt.plot(x, y)
    plt.title('Time of calc')
    plt.ylabel('time, sec')
    plt.xlabel('n')
    plt.grid(True)
    plt.show() 

def pic_count():
    lag = 1
    x = np.arange(1, 11, lag)
    y = np.array([itemcount(n) for n in x])
    fig = plt.figure()
    plt.plot(x, y)
    plt.title('Items count')
    plt.ylabel('count')
    plt.xlabel('n')
    plt.grid(True)
    plt.show() 

if __name__ == "__main__":
    pic_count()

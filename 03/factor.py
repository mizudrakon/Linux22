#!/usr/bin/env python3
import sys

#gets square root of a given number
def sqrt(a):
    if a < 4: return 1
    for i in range(2,a//2+1):
        if i**2 <= a:
            j = i
        else: break
    return j

def getNum(word):
    n = 0
    for c in word:
        if ord(c) < 48 or ord(c) > 59:
            return -1
        n = n*10 + (ord(c)-48)
    return n


def main(arg):
    #get a number from the argument (-1 if arg is not a number)
    n = getNum(arg)
    #we check for the number being negative when reading, but we need to select out 0
    #apparently 1 is just supposed to not give any answer
    if n < 1:
        print('-')
        return
    if n == 1: return

    #deals away with divisions by 2 to simplify the next loop
    while n % 2 == 0:
        print(2)
        n = n // 2

    #identifies and prints the divisors using prime and the square root as the upper limit
    for i in range(3, sqrt(n)+1,2):
        while n % i == 0:
            print(i)
            n = n // i

    #prints what remains of n which has to be 1 or a prime number
    if n > 1:
        print(n)

if __name__ == '__main__':
    if len(sys.argv) > 1:
        #it factorizes possibly many numbers, wondering if this affects the testing script
        i = 0
        for n in sys.argv[1:]:
            if i > 0: print()
            main(n)
            i+=1

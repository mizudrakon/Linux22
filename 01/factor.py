#!/usr/bin/env python3

#gets square root of a given number
def sqrt(a):
    if a < 4: return 1
    for i in range(2,a//2+1):
        if i**2 <= a:
            j = i
        else: break
    return j

def main():
    #read input from the file input.txt
    with open('input.txt', 'r') as f:
        line = f.readline().strip()
        n = 0
        for c in line:
            if ord(c) < 48 or ord(c) > 59:
                print('-')
                return
            n = n*10 + (ord(c)-48)
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
    main()

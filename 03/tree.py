#!/usr/bin/env python3
import os
import sys
#we want to write the contents of the current dir in a recursive tree form

#scandir() gives us objects, we need to return their name attribute for sorted()
def getkey(obj):
    return obj.name

# t is the required number of \t when printing
def printls(path = '.',tab='\t', t = 0,f = True):
    # make a list using os.scandir()
    L = [e for e in os.scandir(path)]
    # sort it by name
    L = sorted(L,key=getkey)
    for e in L:
        #skip symlinks or hidden files
        if e.is_symlink() or e.name[0] == '.':
            continue
        #if file and we want file: print
        if f and e.is_file():
            print(tab*t,end='')
            print(e.name)
        #if dir go deeper
        if  e.is_dir():
            print(tab*t,end='')
            print(e.name + '/')
            printls(path + '/' + e.name,tab,t+1,f)

if __name__ == '__main__':
    #I'm passing a truth value to check if files are supposed to be printed
    f = True
    if len(sys.argv) > 1:
        if '-d' in sys.argv[1:]:
            f = False

        #I like the idea of the program running for a list of paths
        for entry in sys.argv[1:]:
            if entry != '-d' and  os.path.isdir(entry):
                printls(tab=' '*4,path=entry,f=f)
        #there's only -d
        if len(sys.argv) == 2 and sys.argv[1] == '-d':
            printls(tab=' '*4,f=f)
    #there's no argument: print the current dir
    else: printls(tab=' '*4)

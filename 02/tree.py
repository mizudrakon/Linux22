#!/usr/bin/env python3
import os
#we want to write the contents of the current dir in a recursive tree form

#scandir() gives us objects, we need to return their name attribute for sorted()
def getkey(obj):
    return obj.name

# t is the required number of \t when printing
def printls(tab='\t',path = '.',t = 0):
    # make a list using os.scandir()
    L = [e for e in os.scandir(path)]
    # sort it by name
    L = sorted(L,key=getkey)
    for e in L:
        #skip symlinks or hidden files
        if e.is_symlink() or e.name[0] == '.':
            continue
        #if file print
        if e.is_file():
            print(tab*t,end='')
            print(e.name)
        #if dir go deeper
        if e.is_dir():
            print(tab*t,end='')
            print(e.name + '/')
            printls(tab,path + '/' + e.name,t+1)

if __name__ == '__main__':
    printls(' '*4)

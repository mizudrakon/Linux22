#!/usr/bin/env python3

import sys
import os
import tap
from tap import parser as parser

def tap2json(f):
    name = f
    total, passed, skipped, failed = 0, 0, 0, 0
    par = parser.Parser()
    if os.path.isfile(f):
        for line in par.parse_file(f):
            if type(line) == tap.line.Result:
                if line.skip:
                    skipped += 1
                elif line.ok:
                    passed += 1
                else:
                    failed += 1
                total += 1
            elif type(line) == tap.line.Plan or type(line) == tap.line.Diagnostic or type(line) == tap.line.Version:
                continue
            else: #bail-out
                skipped += 8
                total += 8
            pass
    tab = '  '
    print(2*tab,end='')
    print('{')
    if '"' in name:
        n = name.find('"')
        print(3*tab +'"filename": "' + name[:n] + "\\" + name[n:] + '",')
    else:
        print("{}\"filename\": \"{}\",".format(3*tab,name)) 
    print("{}\"total\": {},".format(3*tab,total))
    print("{}\"passed\": {},".format(3*tab,passed))
    print("{}\"skipped\": {},".format(3*tab,skipped))
    print("{}\"failed\": {}".format(3*tab,failed))
    print(2*tab,end='')
    print('}',end='')
    return

def main():
    tab = '  '
    print('{')
    print("\"summary\":[",end='')
    if len(sys.argv) >= 2:
        print()
        #print(sys.argv)
        for i in range(1,len(sys.argv)):
            tap2json(sys.argv[i])
            if i < len(sys.argv)-1:
                print(',')
            else:
                print()
        print("{}]".format(tab))
    else:
        print(']')
    print('}')

if __name__ == '__main__':
    main()
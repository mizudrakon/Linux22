# Tasks 06 (student kotasekj)

| Total                                            |    32 |
|--------------------------------------------------|------:|
| 06/dir.sh                                        |    25 |
| 06/scoring.sh                                    |     7 |
| 06/sysinfo.sh                                    |     0 |
| 06/plot.sh                                       |     0 |

If you see an issue with the grading, please
[open a **Confidential Issue**](https://gitlab.mff.cuni.cz/teaching/nswi177/2022/common/forum/-/issues/new?issue[confidential]=true&issue[title]=Grading+Tasks+06)
in the _Forum_.


For assignments with automated tests you will see a TAP-style result output
that you are familiar with from your pipeline tests in GitLab.

The tests also contains information about points assigned (or subtracted)
for that particular test. There are also tests with _zero points_ that
are informative only (kind of like warnings from your compiler: you
should pay attention but they are not crucial).

## 06/dir.sh

✅ **Submitted** (passed, informative only)

✅ **Executable** (passed, +0 points)

✅ **Shebang** (passed, +0 points)

✅ **Example invocation without formatting** (passed, +6 points)

✅ **Example invocation** (passed, +4 points)

✅ **In current directory without formatting** (passed, +3 points)

✅ **In current directory** (passed, +2 points)

✅ **Special only without formatting** (passed, +3 points)

✅ **Special only** (passed, +2 points)

✅ **Inside empty directory** (passed, +5 points)

❌ **Non-existent file without formatting** (failed, worth 3 points) \

```
-- Unexpected stdout --
actual (2 lines):
  /dev/zero <special>
  /dev/definitely_non_existent <special>
expected (1 lines):
  /dev/zero <special>
args (1 lines):
  /dev/zero /dev/definitely_non_existent
--
```

❌ **Non-existent file** (failed, worth 2 points) \

```
-- Unexpected stdout --
actual (2 lines):
  /dev/zero                     <special>
  /dev/definitely_non_existent  <special>
expected (1 lines):
  /dev/zero  <special>
args (1 lines):
  /dev/zero /dev/definitely_non_existent
--
```

❌ **No existing files in CWD destroyed** (failed, informative only) \

```
-- script has overwritten existing file --
path : test
--
```

✅ **Temporary files properly removed** (passed, informative only)



### General notes (collected from all solutions)

We have seen a lot of duplicate code for two situations: user provides
list of files and user provides no arguments.

Notice how in our solution we bypass this problem by encapsulating it in
a function.

Also note how loop output can be piped for further formatting.

```shell
#!/bin/bash

set -ueo pipefail

show_it() {
    local filename
    local size
    
    for filename in "$@"; do
        if [ -d "$filename" ]; then
            size="<dir>"
        elif [ -f "$filename" ]; then
            size="$( stat --format='%s' "$filename" )"
        elif [ -e "$filename" ]; then
            size="<special>"
        else
            echo "$filename: no such file or directory." >&2
            continue
        fi
        echo "$filename $size"
    done | column --table --table-noheadings --table-columns FILENAME,SIZE --table-right SIZE
}

if [ $# -eq 0 ]; then
    if [ -z "$( ls -A )" ]; then
        exit 0
    fi
    show_it *
else
    show_it "$@"
fi
```


## 06/scoring.sh

✅ **Submitted** (passed, informative only)

✅ **Executable** (passed, +0 points)

✅ **Shebang** (passed, +0 points)

❌ **Example run** (failed, worth 20 points) \

```
-- Program output mismatch --
actual (0 lines):
expected (3 lines):
  alpha:12
  bravo:15
  charlie:8
input (6 lines):
  alpha    5
  charlie  8
  bravo   10
  alpha    7
  bravo    2
  bravo    3
--
```

❌ **Funny names** (failed, worth 10 points) \

```
-- Program output mismatch --
actual (0 lines):
expected (6 lines):
  aux:5
  my_temp:2
  pomocna:4
  team_name:3
  temp:1
  tmp:6
input (6 lines):
  temp 1
  my_temp 2
  team_name 3
  pomocna 4
  aux 5
  tmp 6
--
```

❌ **Many teams** (failed, worth 10 points) \

```
-- Program output mismatch --
actual (0 lines):
expected (100 lines):
  adkbae:6870
  amwjb:13318
  amzjrw:10497
  awaai:24199
  biefpc:6064
  bsymlk:16542
  byyv:13721
  bzowzc:7273
  bzwks:34677
  cfrva:12512
  ciyump:28632
  cpyxxu:15736
  cuwhrt:25005
  cwaog:14124
  dofque:30244
  dqqo:2034
  ejqia:37498
  emsxf:12915
  enpual:39513
  fbdl:36692
  fmnhwr:22184
  fnasq:3243
  fpyun:33065
  fuajta:19363
  gtfgh:7676
  gxrcp:23393
  gyzhtm:12109
  hagut:10094
  hfgt:23796
  hfvykn:25811
  hqam:27020
  hxit:9691
  hxxmt:18960
  idlmve:22587
  iedjlw:31453
  ivhqg:4049
  jbcld:22990
  jgdim:29841
  kdebc:15333
  kjuq:26214
  kmbhf:2437
  kmoy:4855
  lbvz:20572
  ldvr:5661
  lhhf:19766
  lhsj:20169
  ljmv:11706
  lvhzca:37095
  lwygps:10900
  mjyf:9288
  mptpjz:14930
  ndtz:16945
  ntiukt:27423
  nuqj:24602
  onbs:26617
  ookbha:32259
  oozi:29438
  otrb:422
  peuho:17751
  plqho:38304
  pootjl:35080
  qbmfq:27826
  qgiuno:18557
  qjfr:40319
  qjjxge:8079
  qkhmkp:4452
  qrscn:31856
  qrtrk:39110
  qxeea:17348
  roqs:30647
  rpace:6467
  rwgl:36289
  rwxsv:35483
  ssqy:20975
  stywae:32662
  sujnzu:1631
  szzfcz:29035
  tffvpj:33871
  ticdg:39916
  tjqvjm:38707
  tpkcs:2840
  tryvf:14527
  ufbj:1228
  uigj:16139
  ukgp:33468
  upqg:31050
  uqdty:8482
  uqqina:21781
  uruqi:5258
  vvweqt:3646
  wezsmr:35886
  wfbu:8885
  whaogu:11303
  wmrk:21378
  wsjhj:37901
  wzbhp:25408
  xhpr:28229
  xipenz:34274
  xzwgmy:825
  yakl:18154
input (200 lines):
  qgiuno 18417
  lvhzca 36817
  wmrk 21217
  fnasq 26
  tryvf 14417
  lbvz 155
  xhpr 28017
  fpyun 248
  xzwgmy 8
  uruqi 41
  fpyun 32817
  fbdl 275
  ndtz 128
  uqdty 65
  vvweqt 29
  plqho 287
  rpace 50
  adkbae 6817
  emsxf 12817
  qxeea 131
  ookbha 242
  tffvpj 33617
  kdebc 15217
  cfrva 95
  szzfcz 28817
  ldvr 44
  cuwhrt 24817
  hfvykn 25617
  stywae 32417
  biefpc 47
  ejqia 281
  ticdg 299
  xipenz 34017
  ufbj 11
  ejqia 37217
  fmnhwr 167
  hqam 26817
  mptpjz 113
  roqs 230
  kjuq 197
  qjjxge 8017
  mjyf 9217
  lhsj 20017
  gtfgh 59
  hfgt 179
  rwxsv 266
  hxxmt 18817
  gyzhtm 92
  fuajta 146
  plqho 38017
  ljmv 11617
  iedjlw 31217
  wmrk 161
  cpyxxu 119
  onbs 200
  hfgt 23617
  wsjhj 37617
  gyzhtm 12017
  uqdty 8417
  tryvf 110
  qbmfq 209
  byyv 104
  ookbha 32017
  iedjlw 236
  upqg 233
  ukgp 251
  amzjrw 80
  ivhqg 32
  kdebc 116
  amwjb 13217
  ntiukt 206
  onbs 26417
  kmoy 38
  ivhqg 4017
  rwxsv 35217
  lvhzca 278
  kmbhf 20
  upqg 30817
  uigj 122
  sujnzu 14
  qrtrk 38817
  peuho 134
  ufbj 1217
  hfvykn 194
  fnasq 3217
  rwgl 272
  wezsmr 35617
  ssqy 20817
  stywae 245
  tffvpj 254
  hxxmt 143
  wsjhj 284
  hagut 77
  hqam 203
  gxrcp 23217
  qjjxge 62
  uqqina 21617
  lwygps 10817
  lhhf 149
  kmbhf 2417
  wfbu 8817
  adkbae 53
  idlmve 22417
  dofque 227
  sujnzu 1617
  cwaog 107
  kjuq 26017
  whaogu 11217
  enpual 296
  awaai 24017
  fuajta 19217
  qxeea 17217
  ticdg 39617
  yakl 137
  lwygps 83
  cwaog 14017
  ssqy 158
  rpace 6417
  tjqvjm 38417
  yakl 18017
  whaogu 86
  lbvz 20417
  jgdim 224
  amwjb 101
  jbcld 22817
  xzwgmy 817
  cuwhrt 188
  qrscn 31617
  amzjrw 10417
  qbmfq 27617
  roqs 30417
  qrtrk 293
  wfbu 68
  qkhmkp 35
  szzfcz 218
  lhhf 19617
  qjfr 302
  idlmve 170
  ldvr 5617
  jgdim 29617
  xipenz 257
  mptpjz 14817
  fmnhwr 22017
  kmoy 4817
  awaai 182
  uqqina 164
  dqqo 17
  qrscn 239
  qkhmkp 4417
  bsymlk 16417
  ntiukt 27217
  oozi 29217
  tpkcs 2817
  vvweqt 3617
  nuqj 185
  oozi 221
  cpyxxu 15617
  fbdl 36417
  dofque 30017
  ljmv 89
  dqqo 2017
  hagut 10017
  emsxf 98
  mjyf 71
  wzbhp 191
  byyv 13617
  qjfr 40017
  ciyump 215
  bzowzc 7217
  cfrva 12417
  hxit 74
  hxit 9617
  nuqj 24417
  uigj 16017
  jbcld 173
  otrb 5
  ndtz 16817
  otrb 417
  tpkcs 23
  biefpc 6017
  qgiuno 140
  lhsj 152
  xhpr 212
  gxrcp 176
  bzwks 260
  bzowzc 56
  pootjl 263
  wezsmr 269
  bsymlk 125
  bzwks 34417
  wzbhp 25217
  peuho 17617
  ciyump 28417
  ukgp 33217
  gtfgh 7617
  rwgl 36017
  uruqi 5217
  tjqvjm 290
  enpual 39217
  pootjl 34817
--
```

✅ **No data** (passed, +5 points)

✅ **No existing files in CWD destroyed** (passed, +2 points)

❌ **Temporary files properly removed** (failed, worth 3 points) \

```
-- following temporary files were not removed (names were cleaned-up) --
/tmp/tmp.0000000001 (directory, 40 bytes)
--
```



### General notes (collected from all solutions)

Your solutions generally surprised us by their complexity. This task
was supposed to be the easiest to complete :-).

Below is our solution. Notice that we use `mktemp` to create temporary
directory. **Always** create directories like this: you can never now what
files are in the current directory and it is pretty surprising if some file
is overwritten only because it was named `t.txt`.

Our extended test suite tests for that as well in all assignments for 06 so
feel free to check the results of the last two tests to see how your script
behaved.

Kind reader will add proper destruction of the temporary directory `$datas`
into this solution.

Notice that the score is summed at the end of the script: there is really
no need to recompute it all the time and `paste ... | bc` works very well
here.

```shell
#!/bin/bash

set -ueo pipefail

datas="$( mktemp -d )"

while read -r team score; do
    echo "$score" >>"$datas/$team"
done

if [ -z "$( ls -A "$datas" )" ]; then
    exit 0
fi

cd "$datas"
for team in *; do
    echo "${team}:$( paste -s -d + "$team" | bc )"
done
```


## 06/sysinfo.sh

✅ **Submitted** (passed, informative only)

✅ **Executable** (passed, +0 points)

✅ **Shebang** (passed, +0 points)

❌ **Default run** (failed, worth 20 points) \

```
-- Program output mismatch --
actual   :
expected : load=0.05 kernel=5.15.fc34.x86_64 cpus=12
args     :
--
```

❌ **Example run I** (failed, worth 8 points) \

```
-- Program output mismatch --
actual   :
expected : load=0.06 kernel=5.15.fc34.x86_64
args     : -k --load
--
```

❌ **Example run II** (failed, worth 8 points) \

```
-- Program output mismatch --
actual (0 lines):
expected (3 lines):
  load=0.12
  kernel=5.16.fc34.x86_64
  cpus=17
args (1 lines):
  --script
--
```

❌ **Example run III** (failed, worth 8 points) \

```
-- Program output mismatch --
actual   :
expected : cpus=18
args     : -s -c
--
```

❌ **Run with --help** (failed, worth 6 points) \

```
-- Program output mismatch --
actual (0 lines):
expected (9 lines):
  Usage: sysinfo [options]
   -c   --cpu     Print number of CPUs.
   -l   --load    Print current load.
   -k   --kernel  Print kernel version.
   -s   --script  Each value on separate line.
  Without arguments behave as with -c -l -k.
  Copyright NSWI177 2022
args (1 lines):
  --help
--
```

✅ **No existing files in CWD destroyed** (passed, informative only)

✅ **Temporary files properly removed** (passed, informative only)



### General notes (collected from all solutions)

We have noticed a lot of duplicate code. Mostly it was caused by
re-parsing the options several times or using different code for printing
everything in one-line versus printing with `--script`.

The following solution tries to clearly separate program configuration
(command-line parsing) and main program execution.

Notice how information about what to print are stored and how is the
final output formatted.

```shell
#!/bin/bash

set -ueo pipefail

output_merged() {
    paste -s -d ' '
}

show_help() {
cat <<'EOF_HELP'
Usage: sysinfo [options]
 -c   --cpu     Print number of CPUs.
 -l   --load    Print current load.
 -k   --kernel  Print kernel version.
 -s   --script  Each value on separate line.

Without arguments behave as with -c -l -k.

Copyright NSWI177 2022
EOF_HELP

}

opts_short="lkcsh"
opts_long="load,kernel,cpus,help,script"

getopt -Q -o "$opts_short" -l "$opts_long" -- "$@" || exit 1
eval set -- "$( getopt -o "$opts_short" -l "$opts_long" -- "$@" )"

print_all=true
print_load=false
print_kernel=false
print_cpus=false
output_formatter=output_merged

for i in "$@"; do
    case "$i" in
        -l|--load)
            print_load=true
            print_all=false
            ;;
        -k|--kernel)
            print_kernel=true
            print_all=false
            ;;
        -c|--cpus)
            print_cpus=true
            print_all=false
            ;;
        -s|--script)
            output_formatter="cat"
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        --)
            ;;    
        *)
            show_help
            exit 1
            ;;
    esac
done

if $print_all; then
    print_load=true
    print_kernel=true
    print_cpus=true
fi

(
    if $print_load; then
        echo "load=$( cut -d ' ' -f 1 /proc/loadavg )"
    fi
    if $print_kernel; then
        echo "kernel=$( uname -r )"
    fi
    if $print_cpus; then
        echo "cpus=$( nproc )"
    fi
) | $output_formatter
```


## 06/plot.sh

❌ **Submitted** (failed, informative only) \

```
File 06/plot.sh was not submitted.
```

↷ **Executable** (skipped)

↷ **Shebang** (skipped)

↷ **Example run I** (skipped)

↷ **Example run II** (skipped)

↷ **Example run III** (skipped)

↷ **Same values** (skipped)

↷ **COLUMNS not set** (skipped)

↷ **No data** (skipped)

↷ **No existing files in CWD destroyed** (skipped)

↷ **Temporary files properly removed** (skipped)




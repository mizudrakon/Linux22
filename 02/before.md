# Before class quiz (#2)

The quiz has to be submitted to your GitLab project before your lab starts.

Every question is worth 25 points.

Insert your answer inside the marked block (replace the ellipsis).



## Question Q1

Briefly describe what was the most difficult or challenging part of the
previous lab for you.

Your answer: **[A1]** I have no previous experience using GitLab and I expect more troube with it **[/A1]**



## Question Q2

The list below contains various paths. Select all absolute paths from
the list (delimit the individual numbers with comma or space).

1. `/etc/`
2. `../intro/`
3. `.bashrc`
4. `/dev/../etc/os-release`
5. `../share/man/man3/lseek64.3.gz`

Your answer: **[A2]** 1, 4 **[/A2]**



## Question Q3

Resolve the following path to not contain any relative references
(i.e., convert it to an absolute path without any `..` or `.`).

```
/home/../usr/./share/./man/../../lib/../../etc/ssh/.././os-release
```

Your answer: **[A3]** /etc/os-release **[/A3]**



## Question Q4

Select from the options below the one that **best describes** the purpose
of the following fragment of Python code (stripped of comments).

We are after the best possible (i.e., most precise) answer: certainly
an answer of _it is a Python code that prints something_ is true but
that is not what we are after.

```python
stats = {}
with open('/proc/meminfo', 'r') as f:
    for line in f:
        parts = line.split(":")
        stats[parts[0].strip()] = parts[1].split()[0].strip()
print(float(stats['MemFree'])/float(stats['MemTotal']))
```

1. Prints data of the first two lines from the file `/proc/meminfo`.
2. Prints the second column of the file `/proc/meminfo` where the
   columns are separated by colons (`:`).
3. Prints aproximate percentage of free memory on the system.
4. Ensures that `/proc/meminfo` contains valid data.
5. Reads `/proc/meminfo` to determine if they are in a correct format.

Your answer: **[A4]** 3 **[/A4]**




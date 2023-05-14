# Before class quiz (#3)

The quiz has to be submitted to your GitLab project before your lab starts.

Every question is worth 25 points.

Insert your answer inside the marked block (replace the ellipsis).



## Question Q1

Briefly describe what was the most difficult or challenging part of the
previous lab for you.

Your answer: **[A1]** Probbly using wildcards efficiently and doing everything on time **[/A1]**



## Question Q2

Assuming file `script.py` has shebang of `#!/usr/bin/env python3` and the user
executes the following command.

```shell
./script.py alpha.txt
```

Select which command from the list below best describes what is
actually executed.

1. `python3 alpha.txt`
2. `/usr/bin/env python3 script.py alpha.txt`
3. `/usr/bin/env python3 script.py`
4. None of the above as the command does not make any sense.
5. Impossible to specify as it depends on the working directory.

Your answer: **[A2]** 2 **[/A2]**



## Question Q3

Assuming file `script.php` is written in PHP and has shebang of
`#!/usr/bin/env php7` and the user executes the following command.

```shell
php3 ./script.php bravo.txt
```

Select _all true statements_ from the list below (assuming interpreters
for both PHP 3 and PHP 7 are installed).

1. Shebang is ignored.
2. Script is executed with PHP 3 interpreter.
3. System (i.e., shell) refuses to launch the script.
4. Script is executed with PHP 7 interpreter.
5. Shell asks the user which interpreter to use (whether PHP 3 or 7).
6. Executable bit of the `script.php` is set.
7. Script may fail as it was intended for a newer version of PHP.

Your answer: **[A3]** 1, 2, 7 **[/A3]**



## Question Q4

Select the best description of what `git add script.sh` does.

1. Sends current state of `script.sh` to GitLab.
2. Sets current state of `script.sh` to be part of next commit (revision).
3. Updates `script.sh` with changes found on GitLab.
4. Shows history of changes for the file `script.sh`.
5. Checks that `script.sh` has an executable bit and a correct shebang.
6. Executes the script `script.sh` using Git as an interpreter.

Your answer: **[A4]** 2 **[/A4]**




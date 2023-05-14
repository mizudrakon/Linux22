# Before class quiz (#9)

The quiz has to be submitted to your GitLab project before your lab starts.

Every question is worth 25 points.

Insert your answer inside the marked block (replace the ellipsis).



## Question Q1

Briefly describe what was the most difficult or challenging part of the
previous lab for you.

Your answer: **[A1]** My understanding of networking is vary basic, so I'm pretty unsure about everything there so far. I'll have to study op on it later. **[/A1]**



## Question Q2

Briefly compare why `passwd` has sticky bit set but `dnf` (or `apt`)
are used via `sudo` (and never has stick bit set).

Recall that `passwd` is used to change user password (it has other
functions too but we can ignore them here).

`dnf` and `apt` are examples of software package managers, i.e. software
used for installing other applications to the system.

Your answer: **[A2]** We want passwd to be freely used by the user to change their own password without superuser privileges. Package managers need to be given higher privilege only once in a while and when we specify so. **[/A2]**



## Question Q3

Select all correct statements about package management.

1. Package manager is the main entity responsible for software installation
   on a Linux system.
2. Package manager is used to start the installed program.
3. Software repository always contains only patent-free software.
4. Software repository can be prepared by distribution maintainers only.
5. Package usually contains a single program (e.g. Firefox browser) or
   a set of related programs (e.g. an office suite).

Your answer: **[A3]** 1, 5 **[/A3]**



## Question Q4

Select all correct statements about signals and processes.

1. Signal is an asynchronous communication channel.
2. An application can handle (react) to any signal as it sees fit.
3. Different signals are distinguished by their number only.
4. Some signals are never delivered to the application (i.e. handled
   by kernel only).
5. Application must terminate within 5 seconds after receiving the
   `TERM` signal (under all circumstances).
6. Process represents a running program.
7. Every process has its own executable file from which it was started
   (in other words, there is a 1:1 mapping between processes and
   executable files).
8. Each process has a unique ID, called PID.

Your answer: **[A4]** 1, 3, 4, 6, 7, 8 **[/A4]**




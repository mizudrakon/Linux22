# Gallery generator (final task 21) (student kotasekj)

| Total                                            |   100 |
|--------------------------------------------------|------:|
| Manual evaluation (and comments)                 |   100 |
| Gallery (Shellcheck etc.)                        |     0 |
| Gallery (baseline implementation)                |     0 |
| Gallery (output directory)                       |     0 |
| Gallery (theming support)                        |     0 |
| Gallery (proper thumbnail generation)            |     0 |
| Gallery (album configuration)                    |     0 |
| Gallery (EXIF information)                       |     0 |

If you see an issue with the grading, please
[open a **Confidential Issue**](https://gitlab.mff.cuni.cz/teaching/nswi177/2022/common/forum/-/issues/new?issue[confidential]=true&issue[title]=Grading+Gallery+generator+(final+task+21))
in the _Forum_.


For assignments with automated tests you will see a TAP-style result output
that you are familiar with from your pipeline tests in GitLab.

The tests also contains information about points assigned (or subtracted)
for that particular test. There are also tests with _zero points_ that
are informative only (kind of like warnings from your compiler: you
should pay attention but they are not crucial).

## Manual evaluation (and comments)

**Points**: 100

Overall a good solution.

Image size can be retrieved by invoking `identify` with proper `-format` configuration.

Sourcing has the advantage that user can use variables etc. Sedding-it from the config is of course possible too.

Nice and consistent Git messages.


## Gallery (Shellcheck etc.)

✅ **Submitted** (passed, informative only)

✅ **Executable** (passed, +0 points)

✅ **Shebang** (passed, +0 points)

✅ **Shellcheck errors** (passed, +0 points)

✅ **Shellcheck warnings** (passed, +0 points)

✅ **Shellcheck infos** (passed, informative only)

✅ **Shellcheck stylistic** (passed, informative only)



## Gallery (baseline implementation)

❌ **Base gallery generation** (failed, informative only) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./public_html
  ./public_html/001
  ./public_html/001/.meta
  ./public_html/001/.details
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Base gallery generation - custom title** (failed, informative only) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/001
  ./public_html/001/.meta
  ./public_html/001/.details
  ./gallery.rc
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Base gallery generation - intro page** (failed, informative only) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (12 lines):
  .
  ./public_html
  ./public_html/001
  ./public_html/001/.meta
  ./public_html/001/.details
  ./HEADER.md
  ./albums
  ./albums/002
  ./albums/002/3.jpg
  ./albums/002/2.jpg
  ./albums/001
  ./albums/001/1.jpg
--
```



## Gallery (output directory)

❌ **Parameter -d I** (failed, worth 20 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./output
  ./output/001
  ./output/001/.meta
  ./output/001/.details
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Parameter -d II** (failed, worth 5 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./output2
  ./output2/001
  ./output2/001/.meta
  ./output2/001/.details
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Parameter --publish-dir I** (failed, worth 10 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./output3
  ./output3/001
  ./output3/001/.meta
  ./output3/001/.details
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Parameter --publish-dir II** (failed, worth 5 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./output4
  ./output4/001
  ./output4/001/.meta
  ./output4/001/.details
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Option publish_dir** (failed, worth 10 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./output5
  ./output5/001
  ./output5/001/.meta
  ./output5/001/.details
  ./gallery.rc
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```

❌ **Option publish_dir overriden on command-line** (failed, worth 20 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./output11
  ./output11/001
  ./output11/001/.meta
  ./output11/001/.details
  ./gallery.rc
  ./albums
  ./albums/002
  ./albums/002/5.jpg
  ./albums/002/4.jpg
  ./albums/002/3.jpg
  ./albums/001
  ./albums/001/2.jpg
  ./albums/001/1.jpg
--
```



## Gallery (theming support)

❌ **Parameter -t I** (failed, worth 15 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```

❌ **Parameter -t II** (failed, worth 5 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```

❌ **Parameter --theme-dir I** (failed, worth 10 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```

❌ **Parameter --theme-dir II** (failed, worth 5 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```

❌ **Option theme_dir** (failed, worth 10 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (15 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./gallery.rc
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```

❌ **Option theme_dir overriden on command-line** (failed, worth 20 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (15 lines):
  .
  ./public_html
  ./public_html/alpha
  ./public_html/alpha/.meta
  ./public_html/alpha/.details
  ./gallery.rc
  ./albums
  ./albums/bravo
  ./albums/bravo/6.jpg
  ./albums/bravo/5.jpg
  ./albums/bravo/4.jpg
  ./albums/bravo/3.jpg
  ./albums/alpha
  ./albums/alpha/2.jpg
  ./albums/alpha/1.jpg
--
```



## Gallery (proper thumbnail generation)

❌ **Thumbnails generated 200x200** (failed, worth 40 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (13 lines):
  .
  ./public_html
  ./public_html/yankee
  ./public_html/yankee/.meta
  ./public_html/yankee/.details
  ./albums
  ./albums/zulu
  ./albums/zulu/6.jpg
  ./albums/zulu/4.jpg
  ./albums/zulu/3.jpg
  ./albums/yankee
  ./albums/yankee/9.jpg
  ./albums/yankee/1.jpg
--
```

❌ **Thumbnails generated with custom size 300x200** (failed, worth 30 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/yankee
  ./public_html/yankee/.meta
  ./public_html/yankee/.details
  ./gallery.rc
  ./albums
  ./albums/zulu
  ./albums/zulu/6.jpg
  ./albums/zulu/4.jpg
  ./albums/zulu/3.jpg
  ./albums/yankee
  ./albums/yankee/9.jpg
  ./albums/yankee/1.jpg
--
```

❌ **Thumbnails generated with fixed height x200** (failed, worth 25 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/yankee
  ./public_html/yankee/.meta
  ./public_html/yankee/.details
  ./gallery.rc
  ./albums
  ./albums/zulu
  ./albums/zulu/6.jpg
  ./albums/zulu/4.jpg
  ./albums/zulu/3.jpg
  ./albums/yankee
  ./albums/yankee/9.jpg
  ./albums/yankee/1.jpg
--
```



## Gallery (album configuration)

❌ **Custom album title** (failed, worth 35 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/lima
  ./public_html/lima/.meta
  ./public_html/lima/.details
  ./albums
  ./albums/sierra
  ./albums/sierra/5.jpg
  ./albums/sierra/4.jpg
  ./albums/sierra/3.jpg
  ./albums/lima
  ./albums/lima/album.rc
  ./albums/lima/2.jpg
  ./albums/lima/1.jpg
--
```

❌ **Custom album front image** (failed, worth 45 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/lima
  ./public_html/lima/.meta
  ./public_html/lima/.details
  ./albums
  ./albums/sierra
  ./albums/sierra/album.rc
  ./albums/sierra/5.jpg
  ./albums/sierra/4.jpg
  ./albums/sierra/3.jpg
  ./albums/lima
  ./albums/lima/2.jpg
  ./albums/lima/1.jpg
--
```



## Gallery (EXIF information)

❌ **EXIF information extracted** (failed, worth 90 points) \

```
-- Program exit code mismatch --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
stderr (0 lines):
files (14 lines):
  .
  ./public_html
  ./public_html/delta
  ./public_html/delta/.meta
  ./public_html/delta/.details
  ./albums
  ./albums/foxtrot
  ./albums/foxtrot/6.jpg
  ./albums/foxtrot/4.jpg
  ./albums/foxtrot/3.jpg
  ./albums/delta
  ./albums/delta/3.jpg
  ./albums/delta/2.jpg
  ./albums/delta/1.jpg
--
```




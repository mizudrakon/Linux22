# Templater (final task 22) (student kotasekj)

| Total                                            |   210 |
|--------------------------------------------------|------:|
| Manual evaluation (and comments)                 |   100 |
| Templater (automated tests)                      |   110 |

If you see an issue with the grading, please
[open a **Confidential Issue**](https://gitlab.mff.cuni.cz/teaching/nswi177/2022/common/forum/-/issues/new?issue[confidential]=true&issue[title]=Grading+Templater+(final+task+22))
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

Header reading should be in a separate function.


## Templater (automated tests)

✅ **Submitted** (passed, informative only)

✅ **Submitted** (passed, informative only)

✅ **Submitted** (passed, informative only)

✅ **Executable bits** (passed, +0 points)

✅ **Executable bits** (passed, +0 points)

✅ **Executable bits** (passed, +0 points)

✅ **Only reasonable files are committed** (passed, +0 points)

✅ **Simple template** (passed, +40 points)

✅ **Gallons conversion** (passed, +25 points)

✅ **List in header** (passed, +20 points)

✅ **Example from README** (passed, +25 points)

❌ **arabic2roman 12** (failed, worth 35 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: 12 is {{ 12 | arabic2roman }}.
args (1 lines):
  --template template.j2 --input input.txt
stderr (18 lines):
  Traceback (most recent call last):
    File "/tmp/nswi177-tests/tmp.tmp/venv/bin/nswi177-jinja-templater", line 33, in <module>
      sys.exit(load_entry_point('nswi177-jinja-templater', 'console_scripts', 'nswi177-jinja-templater')())
    File "/root/nswi177-temp/student/22/src/templater/main.py", in main
      template = env.get_template(config.template)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 1010, in get_template
      return self._load_template(name, globals)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 969, in _load_template
      template = self.loader.load(self, name, self.make_globals(globals))
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/loaders.py", line 138, in load
      code = environment.compile(source, name, filename)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 768, in compile
      self.handle_exception(source=source_hint)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 936, in handle_exception
      raise rewrite_traceback_stack(source=source)
    File "template.j2", line 1, in template
      {{ course }}: 12 is {{ 12 | arabic2roman }}.
  jinja2.exceptions.TemplateAssertionError: No filter named 'arabic2roman'.
--
```

❌ **arabic2roman 2022** (failed, worth 15 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: 2022 is {{ 2022 | arabic2roman }}.
args (1 lines):
  --template template.j2 --input input.txt
stderr (18 lines):
  Traceback (most recent call last):
    File "/tmp/nswi177-tests/tmp.tmp/venv/bin/nswi177-jinja-templater", line 33, in <module>
      sys.exit(load_entry_point('nswi177-jinja-templater', 'console_scripts', 'nswi177-jinja-templater')())
    File "/root/nswi177-temp/student/22/src/templater/main.py", in main
      template = env.get_template(config.template)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 1010, in get_template
      return self._load_template(name, globals)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 969, in _load_template
      template = self.loader.load(self, name, self.make_globals(globals))
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/loaders.py", line 138, in load
      code = environment.compile(source, name, filename)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 768, in compile
      self.handle_exception(source=source_hint)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 936, in handle_exception
      raise rewrite_traceback_stack(source=source)
    File "template.j2", line 1, in template
      {{ course }}: 2022 is {{ 2022 | arabic2roman }}.
  jinja2.exceptions.TemplateAssertionError: No filter named 'arabic2roman'.
--
```

❌ **arabic2roman negative** (failed, worth 20 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: -12 is {{ -12 | arabic2roman }}.
args (1 lines):
  --template template.j2 --input input.txt
stderr (18 lines):
  Traceback (most recent call last):
    File "/tmp/nswi177-tests/tmp.tmp/venv/bin/nswi177-jinja-templater", line 33, in <module>
      sys.exit(load_entry_point('nswi177-jinja-templater', 'console_scripts', 'nswi177-jinja-templater')())
    File "/root/nswi177-temp/student/22/src/templater/main.py", in main
      template = env.get_template(config.template)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 1010, in get_template
      return self._load_template(name, globals)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 969, in _load_template
      template = self.loader.load(self, name, self.make_globals(globals))
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/loaders.py", line 138, in load
      code = environment.compile(source, name, filename)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 768, in compile
      self.handle_exception(source=source_hint)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 936, in handle_exception
      raise rewrite_traceback_stack(source=source)
    File "template.j2", line 1, in template
      {{ course }}: -12 is {{ -12 | arabic2roman }}.
  jinja2.exceptions.TemplateAssertionError: No filter named 'arabic2roman'.
--
```

❌ **arabic2roman non-number** (failed, worth 20 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  1
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: elephant is {{ "elephant" | arabic2roman }}.
args (1 lines):
  --template template.j2 --input input.txt
stderr (18 lines):
  Traceback (most recent call last):
    File "/tmp/nswi177-tests/tmp.tmp/venv/bin/nswi177-jinja-templater", line 33, in <module>
      sys.exit(load_entry_point('nswi177-jinja-templater', 'console_scripts', 'nswi177-jinja-templater')())
    File "/root/nswi177-temp/student/22/src/templater/main.py", in main
      template = env.get_template(config.template)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 1010, in get_template
      return self._load_template(name, globals)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 969, in _load_template
      template = self.loader.load(self, name, self.make_globals(globals))
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/loaders.py", line 138, in load
      code = environment.compile(source, name, filename)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 768, in compile
      self.handle_exception(source=source_hint)
    File "/tmp/nswi177-tests/tmp.tmp/venv/lib64/python3.9/site-packages/jinja2/environment.py", line 936, in handle_exception
      raise rewrite_traceback_stack(source=source)
    File "template.j2", line 1, in template
      {{ course }}: elephant is {{ "elephant" | arabic2roman }}.
  jinja2.exceptions.TemplateAssertionError: No filter named 'arabic2roman'.
--
```

❌ **US gallons conversion** (failed, worth 80 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  2
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: 100 is {{ 100 | l2gal | round | int }} US gallons.
args (1 lines):
  --template template.j2 --input input.txt --use-us-gallons
stderr (2 lines):
  usage: nswi177-jinja-templater [-h] --template FILENAME.j2 --input INPUT
  nswi177-jinja-templater: error: unrecognized arguments: --use-us-gallons
--
```

❌ **Custom variables I** (failed, worth 60 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  2
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: {{ year }}
args (1 lines):
  --template template.j2 --input input.txt -V year=2022
stderr (2 lines):
  usage: nswi177-jinja-templater [-h] --template FILENAME.j2 --input INPUT
  nswi177-jinja-templater: error: unrecognized arguments: -V year=2022
--
```

❌ **Custom variables II** (failed, worth 60 points) \

```
-- nswi177-jinja-templater terminated with non-zero exit code --
actual (1 lines):
  2
expected (1 lines):
  0
stdout (0 lines):
input (5 lines):
  ---
  course: NSWI177
  ---
  Content is not needed.
template (1 lines):
  {{ course }}: {{ year }} {{ semester }}
args (1 lines):
  --template template.j2 --input input.txt -V year=2022 -V semester=summer
stderr (2 lines):
  usage: nswi177-jinja-templater [-h] --template FILENAME.j2 --input INPUT
  nswi177-jinja-templater: error: unrecognized arguments: -V year=2022 -V semester=summer
--
```




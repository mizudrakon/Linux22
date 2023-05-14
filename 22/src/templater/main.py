#!/usr/bin/env python3


"""Module with CLI"""

import argparse
import io
import os
import sys
import yaml
from .templater import get_jinja_environment, jinja_filter_liters_to_gallons, arabic2roman

def main():
    argv = sys.argv[1:]
    args = argparse.ArgumentParser(description='Templater')
    args.add_argument(
        '--template',
        dest='template',
        required=True,
        metavar='FILENAME.j2',
        help='Jinja2 template file')
    args.add_argument(
        '--input',
        dest='input',
        required=True,
        metavar='INPUT',
        help='Input filename')
    #us gallons
    args.add_argument(
        '--use-us-gallons',
        action='store_true',
        dest = 'us_gallons',
        help = 'switch to US gallons'
    )

    config = args.parse_args(argv)

    env = get_jinja_environment(os.path.dirname(config.template), config.us_gallons)
    template = env.get_template(config.template)

    content = ""
    with open(config.input, 'r') as f:
        content = f.read()

    # TODO: extract YAML header next to these variables
    lines = content.split('\n')
    i = 0
    header_raw = ""
    while lines[i][0:3] != "---":
        i += 1
        
    i += 1
    while lines[i][0:3] != "---":
        header_raw += lines[i]
        header_raw += '\n'
        i += 1
        
    end = i+1
    
    header = yaml.safe_load(header_raw)

    content = ""
    for line in lines[end:]:
        content += line

    variables = {
        'content': content,
        'TEMPLATE': config.template,
        'INPUT': config.input,
    }

    variables.update(header)

    # Use \n even on Windows
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, newline='\n')

    result = template.render(variables)

    print(result)


if __name__ == '__main__':
    main()

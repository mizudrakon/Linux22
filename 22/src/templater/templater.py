"""Module with jinja2 functions"""
import jinja2
import sys
import roman

def jinja_filter_liters_to_gallons(text):
    unit = 0.2199692
    return float(text) * unit

def jinja_filter_liters_to_us_gallons(text):
    return float(text) * 0.264172

def arabic2roman(text):
    #check if the text is a positive integer
    try:
        int(text)
    except ValueError:
        print(f"Warning: arabic2roman: unable to convert {text}.", file=sys.stderr)
        return "NaN"
    
    try:
        roman.toRoman(int(text))
    except roman.OutOfRangeError:
        print(f"Warning: arabic2roman: unable to convert {text}.", file=sys.stderr)
        return "NaN"

    return(roman.toRoman(int(text)))
    

def get_jinja_environment(template_dir,us_gallons):
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(template_dir),
                             autoescape=jinja2.select_autoescape(['html', 'xml']),
                             extensions=['jinja2.ext.do'])
    if us_gallons:
        env.filters['l2gal'] = jinja_filter_liters_to_us_gallons
    else:
        env.filters['l2gal'] = jinja_filter_liters_to_gallons
    env.filters['arabic2roman'] = arabic2roman
    return env



import re

def hey(what):
    what = what.strip()
    if not what:
        return 'Fine. Be that way!'
    if what.upper() == what and re.search('[a-zA-Z]', what):
        return 'Whoa, chill out!'
    if what[-1] == '?':
        return 'Sure.'
    return 'Whatever.'

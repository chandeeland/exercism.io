import re

def is_pangram(msg):
    return len(set(re.sub('[^a-z]', '', msg.lower()))) == 26

# -*- coding: utf-8 -*-

import re
import string

def word_count(msg):
    msg = re.sub(u'[^\w\u0370-\u1FFF+\d]|_', ' ', msg.decode("utf-8").lower())
    words = msg.split()
    counted = dict((word,0) for word in words)
    for word in words:
        counted[word] += 1
    return counted

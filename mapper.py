#!/usr/bin/env python3
import sys
import string

# get all lines from stdin
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip().lower()

    # remove punctuation
    #table = str.maketrans({key: None for key in string.punctuation})
    line = line.translate(str.maketrans("","", string.punctuation))

    # split the line into words; splits on any whitespace
    words = line.split()

    # output tuples (word, 1) in tab-delimited format
    for word in words:
        print ('%s\t%s' % (word, "1"))

#!/usr/bin/env python
import sys
import string
from sklearn.feature_extraction import stop_words
from operator import or_
import spacy 
import nltk
from nltk.corpus import stopwords 

# create set of stopworkds

# Load spacy stopwords

spacy_nlp = spacy.load('en')  
spacy_stopwords = spacy.lang.en.stop_words.STOP_WORDS
stop1 = set(spacy_stopwords)

# convert all elements of the set to utf-8
stop1 = set([x.encode('utf-8') for x in stop1])

# load  sklearn stopwords

stop2 = set(stop_words.ENGLISH_STOP_WORDS)

# load nltk stopwords

stop3 = set(stopwords.words('english'))

# convert all elements of the set to utf-8
stop3 = set([x.encode('utf-8') for x in stop3])

# combine all stopwords  from each set

stops = reduce(or_, [stop1, stop2, stop3])



# Remove stopwrods using loop

# get all lines from stdin
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip().lower()

    # remove punctuation
    #table = str.maketrans({key: None for key in string.punctuation})
    line = line.translate(None, string.punctuation)

    # split the line into words; splits on any whitespace
    words = line.split()

    # output tuples (word, 1) in tab-delimited format
    for word in words:
        if word not in stops:
          print '%s\t%s' % (word, "1")

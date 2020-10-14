#!/usr/bin/env python3
# -*-coding: utf-8 -*-

from subprocess import Popen, PIPE, call
import os, sys

cd = os.path.dirname(os.path.abspath(__file__))

# read response.txt (format: "word\tresponse") into response
with open("./response.txt", encoding='shift_jis') as f:
    response = dict(s.strip().split("\t") for s in f.readlines())

if __name__ == "__main__":

    p = Popen(os.path.join(cd, "julius-utf.bat"), stdout=PIPE, stderr=PIPE)
    output = ''
    while True:
        try:
            line = p.stdout.readline().decode().rstrip()
        except UnicodeDecodeError:
            continue
        
        tokens = line.split()
        if len(tokens) == 0:
            if output:
                print("speak: {}".format(output))
                call([os.path.join(cd, "speak.bat"), output])
                output = ''
        elif tokens[0] == "sentence1:":
            for word in tokens[1:]:
                if response.get(word, None):
                    output = response[word]
            print("ASR result: {}".format(' '.join(tokens[1:])))

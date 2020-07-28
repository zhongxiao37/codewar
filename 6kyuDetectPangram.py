import re
import string

def is_pangram(s):
    return len(set([c for c in re.findall(r'[a-z]', s.lower())])) == 26

pangram = "The quick, brown fox jumps over the lazy dog!"
is_pangram(pangram)
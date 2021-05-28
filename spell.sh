#!/bin/bash

find chapters/ -name '*.tex' ! -name 'sample' ! -name '*_temp.tex' -print -exec hunspell -i UTF-8 -l -d en_US -p hunspell_custom.dic -t {} \;

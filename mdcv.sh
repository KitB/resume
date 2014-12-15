#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

DEFAULT_HEADER=$DIR/header.tex
HEADER=${2-$DEFAULT_HEADER}

DEFAULT_TEMPLATE=$DIR/pandoc-templates/default.latex
TEMPLATE=${3-$DEFAULT_TEMPLATE}

OUTPUT=${1%.md}.pdf

python $DIR/resume.py tex < $1 | pandoc --latex-engine=xelatex --template=$TEMPLATE -H $HEADER -o $OUTPUT

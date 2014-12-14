#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DEFAULT_TEMPLATES=$DIR/pandoc-templates/default.latex
TEMPLATE=${2-$DEFAULT_TEMPLATES}

OUTPUT=${1%.md}.pdf

python resume.py tex < $1 | pandoc --template=$TEMPLATE -H $DIR/header.tex -o $OUTPUT

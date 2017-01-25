#! /bin/bash

LINUX_MYTEX=$(kpsewhich -var-value=TEXMFHOME)

if [ "$(uname)" == "Darwin" ]; then
    rsync -r ./. /Users/matt/Library/texmf/tex/latex/local
    rsync -r ./. /usr/local/texlive/texmf-local/tex/latex/local
    sudo texhash    
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    rsync -r ./. $LINUX_MYTEX/tex/latex/local
fi

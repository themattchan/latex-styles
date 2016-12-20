#! /usr/local/bin/zsh

rsync -r ./. /Users/matt/Library/texmf/tex/latex/local
rsync -r ./. /usr/local/texlive/texmf-local/tex/latex/local
sudo texhash

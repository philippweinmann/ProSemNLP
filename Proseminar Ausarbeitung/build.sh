#!/bin/sh
echo "Deleting old files ..."

find . -type f -name  "*.gls" -delete -or -name  "*.ist" -delete -or -name "*.glo" -delete -or -name "*.glg" -delete -or -name "*.bbl" -delete -or -name "*.aux" -delete -or -name "*.blg" -delete -or -name "*.toc" -delete -or -name "*.glsdefs" -delete -or -name "*.tps" -delete -or -name  "*.log" -delete -or -name "*.out" -delete

echo "First run ..."
pdflatex -interaction nonstopmode thesis
bibtex thesis
makeglossaries thesis

for i in {4..0}; do echo -ne "Waiting ... $i"'\r'; sleep 1; done; echo

echo "Second run ..."
pdflatex thesis
bibtex thesis
makeglossaries thesis

for i in {4..0}; do echo -ne "Waiting ... $i"'\r'; sleep 1; done; echo

echo "Third run ..."
del thesis.pdf
pdflatex thesis
pdflatex thesis

echo "Cleaning ..."

find . -type f -name  "*.gls" -delete -or -name  "*.ist" -delete -or -name "*.glo" -delete -or -name "*.glg" -delete -or -name "*.bbl" -delete -or -name "*.aux" -delete -or -name "*.blg" -delete -or -name "*.toc" -delete -or -name "*.glsdefs" -delete -or -name "*.tps" -delete -or -name  "*.log" -delete -or -name "*.out" -delete


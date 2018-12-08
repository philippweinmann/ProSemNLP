@echo off
echo "Deleting old files ..."
del /s *.gls *.ist *.glo *.glg *.bbl *.aux *.blg *.toc *.glsdefs *.tps *.log *.out
echo "First run ..."
pdflatex -interaction nonstopmode thesis
bibtex thesis
makeglossaries thesis

TIMEOUT /nobreak /t 4

echo "Second run ..."
pdflatex thesis
bibtex thesis
makeglossaries thesis

TIMEOUT /nobreak /t 4

echo "Third run ..."
del thesis.pdf
pdflatex thesis
pdflatex thesis

echo "Cleaning ..."
del /s *.gls *.ist *.glo *.glg *.bbl *.aux *.blg *.toc *.glsdefs *.tps *.log *.out

:: set /p DUMMY=Hit ENTER to continue...
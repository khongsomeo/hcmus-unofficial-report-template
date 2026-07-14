#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Compiling LaTeX Quiz Template ==="
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
echo "=== Quiz build completed successfully ==="

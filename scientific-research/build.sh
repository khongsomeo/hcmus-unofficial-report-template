#!/bin/bash

# Function to compile report
build_report() {
    echo "=== Compiling Scientific Research Project Report ==="
    cd project-report || exit 1
    pdflatex -interaction=nonstopmode main.tex
    bibtex main
    pdflatex -interaction=nonstopmode main.tex
    pdflatex -interaction=nonstopmode main.tex
    cd ..
    echo "=== Report build completed ==="
}

# Function to compile form
build_form() {
    echo "=== Compiling Acceptance Request Form ==="
    cd acceptance-form || exit 1
    pdflatex -interaction=nonstopmode main.tex
    pdflatex -interaction=nonstopmode main.tex
    cd ..
    echo "=== Form build completed ==="
}

# Function to compile individual product report
build_product() {
    echo "=== Compiling Individual Product Report ==="
    cd product-report || exit 1
    pdflatex -interaction=nonstopmode main.tex
    pdflatex -interaction=nonstopmode main.tex
    cd ..
    echo "=== Product Report build completed ==="
}

# Check command line arguments
if [ "$1" == "report" ]; then
    build_report
elif [ "$1" == "form" ]; then
    build_form
elif [ "$1" == "product" ]; then
    build_product
elif [ -z "$1" ]; then
    # Interactive menu if no argument is passed
    echo "Select what you want to compile:"
    echo "1) Scientific Research Project Report"
    echo "2) Acceptance Request Form"
    echo "3) Individual Product Report"
    read -rp "Enter choice [1-3]: " choice
    case $choice in
        1) build_report ;;
        2) build_form ;;
        3) build_product ;;
        *) echo "Invalid choice. Exiting." ; exit 1 ;;
    esac
else
    echo "Usage: bash build.sh [report|form|product]"
    exit 1
fi

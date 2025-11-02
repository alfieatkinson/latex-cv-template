#!/bin/bash

# Build script for LaTeX CV Template
# Usage: ./build.sh [filename]
# If no filename is provided, it will build main.tex

set -e  # Exit on any error

FILENAME=${1:-main}
TEXFILE="${FILENAME}.tex"
PDFFILE="${FILENAME}.pdf"

# Colours for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Colour

echo -e "${BLUE}🔧 Building LaTeX CV: ${TEXFILE}${NC}"

# Check if the .tex file exists
if [ ! -f "$TEXFILE" ]; then
    echo -e "${RED}❌ Error: File ${TEXFILE} not found!${NC}"
    exit 1
fi

# Run pdflatex twice to resolve references
echo -e "${YELLOW}📄 First compilation pass...${NC}"
if pdflatex -interaction=nonstopmode "$TEXFILE" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ First pass completed${NC}"
else
    echo -e "${RED}❌ First pass failed! Check the LaTeX syntax.${NC}"
    exit 1
fi

echo -e "${YELLOW}📄 Second compilation pass...${NC}"
if pdflatex -interaction=nonstopmode "$TEXFILE" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Second pass completed${NC}"
else
    echo -e "${RED}❌ Second pass failed! Check the LaTeX syntax.${NC}"
    exit 1
fi

# Clean up auxiliary files
echo -e "${YELLOW}🧹 Cleaning up auxiliary files...${NC}"
rm -f "${FILENAME}.aux" "${FILENAME}.fdb_latexmk" "${FILENAME}.fls" "${FILENAME}.log" "${FILENAME}.out"

# Check if PDF was created successfully
if [ -f "$PDFFILE" ]; then
    FILESIZE=$(du -h "$PDFFILE" | cut -f1)
    echo -e "${GREEN}🎉 Build complete! Output: ${PDFFILE} (${FILESIZE})${NC}"
else
    echo -e "${RED}❌ Error: PDF file was not created!${NC}"
    exit 1
fi
#!/bin/bash

# Build script for LaTeX CV Template
# Usage: ./build.sh [filename]
# If no filename is provided, it will build main.tex
# Produces both normal and redacted versions

set -e  # Exit on any error

FILENAME=${1:-main}
TEXFILE="${FILENAME}.tex"
OUTPUT_DIR="output"

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

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to build a version
build_version() {
    local version_name=$1
    local temp_file=$2
    local output_name=$3
    
    echo -e "${YELLOW}📄 Building ${version_name} version - First pass...${NC}"
    if pdflatex -interaction=nonstopmode "$temp_file" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ ${version_name} first pass completed${NC}"
    else
        echo -e "${RED}❌ ${version_name} first pass failed! Check the LaTeX syntax.${NC}"
        return 1
    fi

    echo -e "${YELLOW}📄 Building ${version_name} version - Second pass...${NC}"
    if pdflatex -interaction=nonstopmode "$temp_file" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ ${version_name} second pass completed${NC}"
    else
        echo -e "${RED}❌ ${version_name} second pass failed! Check the LaTeX syntax.${NC}"
        return 1
    fi
    
    # Move the PDF to output directory
    local temp_pdf="${temp_file%.tex}.pdf"
    if [ -f "$temp_pdf" ]; then
        mv "$temp_pdf" "$OUTPUT_DIR/$output_name"
        local filesize=$(du -h "$OUTPUT_DIR/$output_name" | cut -f1)
        echo -e "${GREEN}✅ ${version_name} version complete: $OUTPUT_DIR/$output_name (${filesize})${NC}"
    else
        echo -e "${RED}❌ Error: ${version_name} PDF file was not created!${NC}"
        return 1
    fi
}

# Build normal version (without redaction)
echo -e "${BLUE}Building normal version...${NC}"
# Temporarily move redaction config so normal version doesn't load it
REDACTION_CONFIG="preamble/redaction-config.tex"
TEMP_REDACTION_CONFIG="redaction-config-temp.tex"
if [ -f "$REDACTION_CONFIG" ]; then
    mv "$REDACTION_CONFIG" "$TEMP_REDACTION_CONFIG"
fi

cp "$TEXFILE" "temp-normal.tex"
build_version "Normal" "temp-normal.tex" "${FILENAME}.pdf"

# Restore redaction config for redacted version
if [ -f "$TEMP_REDACTION_CONFIG" ]; then
    mv "$TEMP_REDACTION_CONFIG" "$REDACTION_CONFIG"
fi

# Build redacted version  
echo -e "${BLUE}Building redacted version...${NC}"
# Create temporary file - the class file will automatically load redaction-config.tex if it exists
cat > temp-redacted.tex << EOF
\\documentclass{curriculumvitae}

\\input{preamble/personal-details.tex}

\\begin{document}

\\makeheader{}

\\small{}
\\input{sections/professional-summary.tex}
\\input{sections/education.tex}
\\input{sections/experience.tex}
\\input{sections/projects.tex}
\\input{sections/skills.tex}
\\input{sections/courses-and-certifications.tex}
\\input{sections/awards.tex}
\\input{sections/volunteer-positions.tex}
\\input{sections/additional-information.tex}
\\input{sections/references.tex}

\\end{document}
EOF

build_version "Redacted" "temp-redacted.tex" "redacted.pdf"

# Clean up all temporary files
echo -e "${YELLOW}🧹 Cleaning up temporary files...${NC}"
rm -f temp-normal.tex temp-redacted.tex
rm -f temp-normal.aux temp-normal.fdb_latexmk temp-normal.fls temp-normal.log temp-normal.out temp-normal.pdf
rm -f temp-redacted.aux temp-redacted.fdb_latexmk temp-redacted.fls temp-redacted.log temp-redacted.out temp-redacted.pdf
rm -f "${FILENAME}.aux" "${FILENAME}.fdb_latexmk" "${FILENAME}.fls" "${FILENAME}.log" "${FILENAME}.out"

echo -e "${GREEN}🎉 Build complete! Both versions created in $OUTPUT_DIR directory:${NC}"
echo -e "${GREEN}   📄 Normal version: $OUTPUT_DIR/${FILENAME}.pdf${NC}"
echo -e "${GREEN}   🔒 Redacted version: $OUTPUT_DIR/redacted.pdf${NC}"
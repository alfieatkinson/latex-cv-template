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
    local output_dir=${4:-"$OUTPUT_DIR"}  # Allow override of output directory
    
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
        mv "$temp_pdf" "$output_name"
        local filesize=$(du -h "$output_name" | cut -f1)
        echo -e "${GREEN}✅ ${version_name} version complete: $output_name (${filesize})${NC}"
    else
        echo -e "${RED}❌ Error: ${version_name} PDF file was not created!${NC}"
        return 1
    fi
}

# Build normal version (without redaction)
echo -e "${BLUE}Building normal version...${NC}"
# Create a temporary directory in the workspace to avoid permission issues
TEMP_DIR="$(pwd)/.build_temp_normal_$$"
mkdir -p "$TEMP_DIR"

# Copy necessary files to temp directory
cp -r preamble "$TEMP_DIR/"
cp -r sections "$TEMP_DIR/"
cp curriculumvitae.cls "$TEMP_DIR/"

# Remove redaction config from the temp preamble directory so it won't be loaded
rm -f "$TEMP_DIR/preamble/redaction-config.tex"

# Copy the main tex file
cp "$TEXFILE" "$TEMP_DIR/temp-normal.tex"

# Build in temp directory
cd "$TEMP_DIR"
build_version "Normal" "temp-normal.tex" "${FILENAME}.pdf"
cd - > /dev/null

# Copy result back to original output directory
mkdir -p "$OUTPUT_DIR"
cp "$TEMP_DIR/${FILENAME}.pdf" "$OUTPUT_DIR/"

# Build redacted version  
echo -e "${BLUE}Building redacted version...${NC}"
# Create redacted version in temp directory
TEMP_DIR_REDACTED="$(pwd)/.build_temp_redacted_$$"
mkdir -p "$TEMP_DIR_REDACTED"

# Copy necessary files to temp directory
cp -r preamble "$TEMP_DIR_REDACTED/"
cp -r sections "$TEMP_DIR_REDACTED/"
cp curriculumvitae.cls "$TEMP_DIR_REDACTED/"

# Create temporary file - the class file will automatically load redaction-config.tex if it exists
cat > "$TEMP_DIR_REDACTED/temp-redacted.tex" << EOF
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

# Build in temp directory
cd "$TEMP_DIR_REDACTED"
build_version "Redacted" "temp-redacted.tex" "redacted.pdf"
cd - > /dev/null

# Copy result back to original output directory
mkdir -p "$OUTPUT_DIR"
cp "$TEMP_DIR_REDACTED/redacted.pdf" "$OUTPUT_DIR/"

# Clean up all temporary files
echo -e "${YELLOW}🧹 Cleaning up temporary files...${NC}"
rm -rf "$(pwd)/.build_temp_normal_$$" "$(pwd)/.build_temp_redacted_$$" 2>/dev/null || true
rm -f "${FILENAME}.aux" "${FILENAME}.fdb_latexmk" "${FILENAME}.fls" "${FILENAME}.log" "${FILENAME}.out" 2>/dev/null || true

echo -e "${GREEN}🎉 Build complete! Both versions created in $OUTPUT_DIR directory:${NC}"
echo -e "${GREEN}   📄 Normal version: $OUTPUT_DIR/${FILENAME}.pdf${NC}"
echo -e "${GREEN}   🔒 Redacted version: $OUTPUT_DIR/redacted.pdf${NC}"
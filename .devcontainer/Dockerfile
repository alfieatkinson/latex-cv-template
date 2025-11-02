FROM fedora:latest

# Install full TeX Live + tools
RUN dnf install -y \
    texlive-scheme-full \
    latexmk \
    biber \
    python3 \
    python3-pip \
    ghostscript \
    git \
    && dnf clean all

# Set a non-root user for VS Code compatibility
RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /workspace

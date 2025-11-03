FROM fedora:latest

# Install system packages and full TeX Live in separate layers for better caching
RUN dnf update -y && \
    dnf install -y \
    python3 \
    python3-pip \
    ghostscript \
    git \
    bash \
    && dnf clean all

# Install TeX Live in a separate layer for better caching
RUN dnf install -y \
    texlive-scheme-full \
    latexmk \
    biber \
    && dnf clean all

# Set a non-root user for VS Code compatibility
RUN useradd -ms /bin/bash dev

# Create workspace directory with proper permissions
RUN mkdir -p /workspace && chown dev:dev /workspace

USER dev
WORKDIR /workspace

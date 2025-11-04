# Use Fedora 40 as base
FROM fedora:40

# Install system packages in a single layer for better caching
RUN dnf update -y && \
    dnf install -y \
    python3 \
    python3-pip \
    ghostscript \
    git \
    bash \
    && dnf clean all

# Install minimal TeXLive and required collections
# This layer will be cached unless package requirements change
RUN dnf install -y \
    # Core TeXLive installation
    texlive-scheme-basic \
    texlive-collection-latex \
    texlive-collection-latexrecommended \
    texlive-collection-latexextra \
    texlive-collection-fontsrecommended \
    texlive-collection-fontutils \
    # Build tools
    latexmk \
    && dnf clean all

# User setup
RUN useradd -ms /bin/bash dev && \
    mkdir -p /workspace && \
    chown dev:dev /workspace

USER dev
WORKDIR /workspace

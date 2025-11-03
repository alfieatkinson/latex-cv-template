# Multi-stage build for better caching
FROM fedora:40 AS base

# Install system packages first
RUN dnf update -y && \
    dnf install -y \
    python3 \
    python3-pip \
    ghostscript \
    git \
    bash \
    && dnf clean all

# Install TeX Live and related packages
FROM base AS texlive
RUN dnf install -y \
    texlive-scheme-full \
    latexmk \
    biber \
    && dnf clean all

# Final stage
FROM texlive AS final

# User setup
RUN useradd -ms /bin/bash dev

# Create workspace directory with proper permissions
RUN mkdir -p /workspace && chown dev:dev /workspace

USER dev
WORKDIR /workspace

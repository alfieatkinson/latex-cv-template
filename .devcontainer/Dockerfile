# Use Ubuntu LTS for reliable LaTeX packages
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install LaTeX and required packages in a single layer
RUN apt-get update && apt-get install -y \
    # Essential system tools
    bash \
    git \
    python3 \
    python3-pip \
    ghostscript \
    # Core LaTeX installation - only what we need
    texlive-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    latexmk \
    # Clean up to reduce image size
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create non-root user
RUN useradd -ms /bin/bash dev && \
    mkdir -p /workspace && \
    chown dev:dev /workspace

USER dev
WORKDIR /workspace

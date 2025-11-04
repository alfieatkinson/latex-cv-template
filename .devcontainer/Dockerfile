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

# Install minimal TeXLive scheme and only required packages
# This layer will be cached unless package requirements change
RUN dnf install -y \
    # Core TeXLive installation (minimal)
    texlive-scheme-basic \
    texlive-collection-latex \
    texlive-collection-latexrecommended \
    # Build tools
    latexmk \
    # Specific packages required by your CV template
    texlive-xcolor \
    texlive-geometry \
    texlive-enumitem \
    texlive-fancyhdr \
    texlive-multicol \
    texlive-graphicx \
    texlive-fontawesome5 \
    texlive-tcolorbox \
    texlive-hyperref \
    texlive-ifthen \
    texlive-titlesec \
    texlive-tabularx \
    texlive-wrapfig \
    texlive-ragged2e \
    texlive-marvosym \
    texlive-cfr-lm \
    texlive-fontenc \
    texlive-lipsum \
    texlive-float \
    texlive-verbatim \
    # Font packages for your template's font options
    texlive-collection-fontsrecommended \
    texlive-collection-fontutils \
    # Additional LaTeX packages that might be needed
    texlive-latexsym \
    texlive-fullpage \
    && dnf clean all

# User setup
RUN useradd -ms /bin/bash dev && \
    mkdir -p /workspace && \
    chown dev:dev /workspace

USER dev
WORKDIR /workspace

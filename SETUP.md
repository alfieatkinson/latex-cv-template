# Repository Setup Guide

## For Personal CV Repositories

If you're using this template for your personal CV:

1. **Replace the workflow**: Delete `.github/workflows/publish-cv.yml` and rename `publish-cv-personal.yml` to `publish-cv.yml`
2. **Set up permissions**: Go to your repository **Settings** → **Actions** → **General** → **Workflow permissions** and select **"Read and write permissions"**
3. **Enable Pages**: Go to **Settings** → **Pages** and set source to "GitHub Actions"

The personal workflow will:
- Build a Docker container with LaTeX
- Compile your CV 
- Create GitHub releases with PDFs
- Deploy to GitHub Pages

## For Template Development

The default workflow (`publish-cv.yml`) just tests that the template builds correctly without publishing anything. This is appropriate for the template repository itself.

## First Run

The first time you push to your personal repository, the workflow takes about 2-3 minutes to build the container, then subsequent builds are much faster due to caching.
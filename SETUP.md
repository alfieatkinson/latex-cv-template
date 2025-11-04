# Repository Setup Guide

## GitHub Actions Permissions

If you get 403 Forbidden errors when the workflow tries to push to GitHub Container Registry:

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Actions** → **General**  
3. Under **Workflow permissions**, select **"Read and write permissions"**
4. Click **Save**

That's it! The workflow will now be able to build and push the Docker container.

## First Run

The first time you push to your repository, the workflow will:
1. Build a fresh Docker container with LaTeX
2. Compile your CV 
3. Create a GitHub release with the PDF
4. Deploy to GitHub Pages

This process takes about 2-3 minutes initially, then subsequent builds are much faster due to caching.
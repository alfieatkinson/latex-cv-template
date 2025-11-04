# GitHub Container Registry (GHCR) Setup Guide

## Quick Fix for 403 Forbidden Errors

The most common cause is repository permissions. Here's the solution:

### Step 1: Repository Settings
1. Go to your repository on GitHub
2. Navigate to **Settings** → **Actions** → **General**
3. Under **Workflow permissions**, select **"Read and write permissions"**
4. Click **Save**

### Step 2: Verify Container Registry Access
1. In repository **Settings** → **Code security and analysis**
2. Ensure package creation is allowed

### Step 3: Re-run the Workflow
The optimized workflow now uses:
- `username: ${{ github.repository_owner }}` for better authentication
- GitHub Actions cache for faster builds
- Lightweight Ubuntu-based container

## Container Optimization

The new setup provides:
- **Faster builds**: Minimal LaTeX installation with only required packages
- **Better caching**: Uses GitHub Actions cache instead of registry cache
- **Cleaner workflow**: Simplified and more reliable authentication

## Troubleshooting

If you still encounter issues:
1. Ensure you have admin access to the repository
2. Check that GitHub Actions are enabled for the repository
3. Verify that packages can be created in your organization/account settings

The workflow will automatically build and push a lightweight LaTeX container optimized for CV compilation.
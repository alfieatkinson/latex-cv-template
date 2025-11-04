# LaTeX CV Template - Getting Started

## Quick Start

1. **Use this template**: Click "Use this template" on GitHub to create your own repository
2. **Open in DevContainer**: Open in VS Code and select "Reopen in Container" 
3. **Customise your CV**: Edit the files in `preamble/` and `sections/` directories
4. **Build locally**: Run `./build.sh` to generate your CV PDFs

## Development Environment

This template includes a DevContainer configuration that provides:
- Complete LaTeX environment with all required packages
- VS Code LaTeX Workshop extension
- Optimised for fast builds (~400MB container vs 4GB full TeXLive)

## Adding GitHub Actions (Optional)

If you want automated builds and releases:

1. **Create workflow file**: Copy the workflow template from the repository releases or documentation
2. **Set permissions**: Repository Settings → Actions → General → Workflow permissions → "Read and write permissions"
3. **Enable Pages**: Repository Settings → Pages → Source: "GitHub Actions"

## Project Structure

```
├── main.tex                    # Main CV document
├── build.sh                    # Build script
├── curriculumvitae.cls         # LaTeX class with all CV commands
├── preamble/
│   ├── personal-details.tex    # Your contact information
│   └── redaction-config.tex    # Privacy settings
└── sections/
    ├── experience.tex          # Work experience
    ├── education.tex           # Education history
    ├── projects.tex            # Projects and portfolio
    └── skills.tex              # Skills and competencies
```

Edit the files in `preamble/` and `sections/` to create your CV!
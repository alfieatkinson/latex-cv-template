# LaTeX CV Template

A professional, modular LaTeX CV template with privacy-focused redaction features. Optimised for fast builds with DevContainer support.

## Key Features

- **Privacy-First Design**: Built-in redaction system for multiple CV versions
- **Fast Development**: Optimised DevContainer with minimal LaTeX packages (~400MB vs 4GB)
- **Professional Layout**: ATS-friendly design with modular sections
- **Easy Customisation**: Pre-built commands for all CV elements

## Quick Start

### Option 1: Use DevContainer (Recommended)
1. Clone this repository
2. Open in VS Code and select "Reopen in Container"
3. Edit `preamble/personal-details.tex` with your information
4. Run `./build.sh` to build your CV

### Option 2: Local LaTeX Installation
Requires a full LaTeX installation with the packages listed in `.devcontainer/Dockerfile`.

## Redaction System

Create privacy-safe versions of your CV:

```bash
./build.sh        # Creates output/main.pdf (full version)
./build.sh redacted   # Creates output/redacted.pdf (privacy-safe)
```

The redacted version automatically hides sensitive information like contact details, addresses, and company URLs. Configure what gets redacted in `preamble/redaction-config.tex`.

## Project Structure

```
├── curriculumvitae.cls              # LaTeX class with CV commands
├── main.tex                         # Main document
├── build.sh                         # Build script
├── .devcontainer/                   # DevContainer configuration
├── preamble/
│   ├── personal-details.tex         # Your contact information
│   └── redaction-config.tex         # Privacy settings
└── sections/                        # CV sections (edit these)
    ├── professional-summary.tex
    ├── experience.tex
    ├── education.tex
    ├── projects.tex
    ├── skills.tex
    └── [other sections...]
```

## Customisation

### Personal Information
Edit `preamble/personal-details.tex`:
```latex
\name{Your Name}
\email{your.email@example.com}
\phone{+44 1234 567890}
\linkedin{linkedin.com/in/yourprofile}
\github{github.com/yourusername}
```

### CV Content
Edit the files in the `sections/` directory. Each section has pre-built commands:

- **Experience**: `\job{Company}{URL}{Location}{Title}{Start}{End}{bullet points}`
- **Education**: `\shortdegree{Institution}{Degree}{Grade}{Year}{Modules}`
- **Projects**: `\project{Name}{Description}{Start}{End}{GitHub}{Demo}{bullets}`
- **Skills**: `\skillgroup{Category}{Skill1, Skill2, Skill3}`

### Styling
Modify colours and fonts in `curriculumvitae.cls`:
```latex
\definecolor{accentcolor}{RGB}{72, 0, 128}  % Change accent colour
```

## License

Creative Commons BY-NC 4.0 - Free for non-commercial use with attribution.
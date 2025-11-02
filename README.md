# LaTeX CV Template

A professional, modular LaTeX CV template designed for easy customisation and consistent formatting. Works out-of-the-box in VS Code with DevContainer support, or on any system with a full LaTeX installation.

## Features

- **Professional Design**: Clean, modern layout that's ATS-friendly
- **Modular Structure**: Separate files for each CV section for easy organisation
- **Comprehensive Commands**: Pre-built commands for all common CV elements
- **Customisable Styling**: Easy-to-modify colours, fonts, and spacing
- **Social Media Integration**: Built-in support for LinkedIn, GitHub, personal websites
- **DevContainer Support**: Consistent LaTeX environment across different machines
- **Flexible Layout**: Support for various section types and formatting options

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/alfieatkinson/latex-cv-template.git
cd latex-cv-template
```

### 2. Customise Your Personal Details

Edit `preamble/personal-details.tex` with your information:

```latex
\name{Your Name}
\phone{+44 1234 567890}
\email{your.email@example.com}
\website{yourwebsite.com}
\linkedin{linkedin.com/in/yourprofile}
\github{github.com/yourusername}
\city{Your City}
\county{Your County}
\country{Your Country}
```

### 3. Build Your CV

```bash
./build.sh           # Builds main.tex
```

### Using VS Code (Recommended)

1. Open the folder in VS Code
2. If using the DevContainer, select "Reopen in Container"
3. Edit your files as needed
4. Build using the LaTeX Workshop extension or the terminal build script

## Project Structure

```
├── curriculumvitae.cls              # Main LaTeX class file with all commands
├── main.tex                         # Main document file
├── build.sh                         # Automated build script
├── preamble/
│   └── personal-details.tex         # Your contact information
└── sections/                        # Individual CV sections
    ├── professional-summary.tex
    ├── education.tex
    ├── experience.tex
    ├── projects.tex
    ├── skills.tex
    ├── courses-and-certifications.tex
    ├── awards.tex
    ├── volunteer-positions.tex
    ├── additional-information.tex
    └── references.tex
```

## Template Commands

### Personal Information

```latex
\name{Your Name}
\phone{Phone Number}
\email{Email Address}
\website{Website URL}
\linkedin{LinkedIn Profile}
\github{GitHub Profile}
\city{City}, \county{County}, \country{Country}
```

### Experience

```latex
\job{Company Name}{Website URL}{Location}{Job Title}{Start Date}{End Date}{
    \item Achievement or responsibility
    \item Another key accomplishment
}
```

### Education

```latex
% Detailed education entry
\longdegree{Institution}{Location}{Degree Title}{Start Year}{End Year}
           {Grade}{Activities}{Relevant Modules}

% Simple education entry
\shortdegree{Institution}{Degree}{Grade}{Year}{Key Subjects}
```

### Projects

```latex
\project{Project Name}{Description}{Start Date}{End Date}
        {GitHub URL}{Live Demo URL}{
    \item Key feature or achievement
    \item Technologies used
}
```

### Skills

```latex
\skillgroup{Category}{Skill1, Skill2, Skill3}
```

### Certifications

```latex
% Simple course
\course{Course Name}{Provider}{Provider URL}{Start Date}{End Date}

% Detailed certificate
\certificate{Cert Name}{Issuer}{URL}{Issue Date}{Expiry Date}{Description}
```

## Customisation

### Colours

Modify the accent colour in `curriculumvitae.cls`:

```latex
\definecolor{accentcolor}{RGB}{72, 0, 128}  % Change to your preferred colour
```

### Fonts

The template uses Charter font by default. To change fonts, modify the font package imports in the class file.

### Section Organisation

The modular structure allows you to:

- Reorder sections by changing their order in `main.tex`
- Remove sections by commenting out the corresponding `\input` statements
- Add custom sections by creating new files in the `sections/` directory

## Build Options

### Automated Build Script

```bash
./build.sh              # Builds main.tex
./build.sh filename     # Builds any specified .tex file
```

The build script provides:

- ✅ Automatic two-pass compilation for proper cross-references
- ✅ Error detection and reporting
- ✅ Automatic cleanup of auxiliary files
- ✅ colour-coded output for build status

### Manual Build

```bash
pdflatex main.tex
pdflatex main.tex  # Second pass for references
```

### VS Code Integration

The template works seamlessly with the LaTeX Workshop extension for:

- Real-time preview
- Automatic building on save
- Error highlighting and navigation

## DevContainer Support

The included DevContainer configuration provides:

- Pre-configured LaTeX environment with all necessary packages
- VS Code extensions for LaTeX editing
- Consistent build environment across different machines
- No local LaTeX installation required

## License

This project is licensed under Creative Commons BY-NC 4.0:

- ✅ **Permitted**: Share and adapt for non-commercial purposes with attribution
- ❌ **Prohibited**: Commercial use without explicit permission

See [LICENSE](LICENSE) for complete terms.

## Contributing

Contributions are welcome for non-commercial use. Please:

1. Fork the repository
2. Create a feature branch for your changes
3. Test your modifications thoroughly
4. Submit a pull request with a clear description of improvements
5. Ensure proper attribution to the original template

## Support

For issues or questions:

- Check the example in `main.tex` for usage patterns
- Review the command reference in this README
- Submit issues via GitHub for bugs or feature requests

---

⚠️ **Note**: This template prioritses clean, professional presentation suitable for both human readers and ATS parsing systems.
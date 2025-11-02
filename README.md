# LaTeX CV Template

A clean, modular, and reusable LaTeX CV template, designed for professional CVs and ready-to-build PDFs. Works out-of-the-box in VS Code with a DevContainer, or on any system with a full LaTeX installation.

---

## Features

- Pre-built sections for **Education**, **Experience**, **Projects**, **Skills**, and **Certifications**
- Modular `.tex` structure for easy customization
- Ready-to-build with `latexmk` and PDF output
- Optional **DevContainer** support for consistent builds across machines
- Minimal dependencies; works with standard TeX Live distributions

---

## Getting Started

### Clone the repository

```bash
git clone https://github.com/alfieatkinson/latex-cv-template.git
cd latex-cv-template
```

### Using VS Code (recommended)

1. Open the folder in VS Code
2. If using the DevContainer, select Reopen in Container
3. Edit main.tex to fill in your details
4. Build the PDF using LaTeX Workshop or via terminal:

   ```bash
   latexmk -pdf main.tex
   ```

### Using locally without DevContainer

Ensure you have a **full LaTeX distribution** installed (TeX Live recommended) and run:

```bash
latex -pdf main.tex
```

## Customisation

TBA

## Contribution & Forking

Contributions and forks are welcome for non-commercial purposes. Please follow these guidelines:

1. Fork or clone the repository
2. Make changes in a feature branch
3. Submit a pull request to the main repository if you want your improvements considered
4. Always credit the original template where appropriate

> ⚠️ This template is for personal and educational use. Commercial use requires contacting the repository owner for permission.

## License

This project is released under a Non-Commercial Creative Commons licence (CC BY-NC 4.0):

- You may share and adapt the template for non-commercial purposes
- You must give appropriate credit
- You cannot use it for commercial purposes without permission

See [LICENSE](LICENSE) for full details.

## Why this template exists

Maintaining a professional CV can be time-consuming. This template provides a:

- Reproducible environment for LaTeX builds
- Modular and professional layout
- Cross-platform workflow using VS Code DevContainer or standard LaTeX

Save time, avoid build errors, and maintain a polished CV effortlessly.

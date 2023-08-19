# SSP-QE

This repository contains example codes for the book:

N. T. Hung, A. R. T. Nugraha and R. Saito, **Quantum ESPRESSO Course for Solid‑State Physics**, *Jenny Stanford Publishing*, New York, 372 Pages (2022).

DOI:  https://doi.org/10.1201/9781003290964

eBook ISBN:  9781003290964

Paperback ISBN: 9789814968379

![book-dft-cover (1)](https://github.com/nguyen-group/QE-SSP/assets/46996256/c8a678f0-2bee-4757-89c5-d3c4c2a072c8)

# Directory Description

```md
QE-SSP
├── gr
│   ├── scf: Total energy and self‐consistent field calculations (Sec. 3.1.1)
│   ├── ecut: Plane‐wave cut‐off energy (Sec. 3.1.2)
│   ├── k-point: k‐points for Brillouin‐zone integration (Sec. 3.1.3)
│   ├── relax: Optimizing atomic positions (Sec. 3.1.4)
│   ├── vc-relax: Optimizing unit cell (Sec. 3.1.5)
│   ├── pps: Selecting pseudopotential (Sec. 3.1.6)
│   ├── smearing: Selecting smearing function and energy (Sec. 3.1.7)
│   ├── rho: Charge density (Sec. 3.2.1)
│   ├── bands: Electronic energy dispersion (Sec. 3.2.2)
│   ├── edos: Electronic density of states (Sec. 3.2.3)
│   ├── pdos: Partial density of states (Sec. 3.2.4)
│   ├── phonon: Phonon dispersion (Sec. 3.3.1)
│   ├── phdos: Phonon density of states (Sec. 3.3.2)
│   ├── elph: Electron‐phonon interaction (Sec. 3.3.3)
│   ├── alpha: Eliashberg spectral function (Sec. 3.3.4)
│   ├── w90: Wannier functions, energy dispersion, and tight‐binding parameters (Sec. 3.6.1)
│   └── pseudo: Pseudopotential files for the C atom
├── mos2
│   ├── optic: Dielectric function, absorption spectra, and joint density of states (Secs. 3.4.2 & 3.4.1)
│   ├── raman: Non‐resonant Raman spectra (Sec. 3.4.3)
│   ├── soc: Spin‐orbit coupling (Sec. 3.5.1)
│   ├── w90: Wannier interpolation for hybrid functional (Sec. 3.6.2)
│   └── pseudo: Pseudopotential files for the Mo and S atoms
├── bi-gr
│   ├── vdw: Van der Waals interaction (Sec. 3.5.2)
│   ├── elec-field: External electric field (Sec. 3.5.3)
│   └── pseudo: Pseudopotential files for the C atom
├── dft-he: A simple DFT‐LDA program for an atom (Sec. 4.14)
├── gete: Quantum ESPRESSO input generators for an example GeTe (Sec. 6.1)
├── scripts: Shell scripts and batch jobs (Sec. 6.3)
└── matplotlib: Creating and using your Matplotlib style (Sec. 6.4.5)
```
# Book Discussions
Thank you for using our book, and don't hesitate to contact us using the GitHub discussions page: [https://github.com/nguyen-group/QERaman/discussions](https://github.com/nguyen-group/QE-SSP/discussions) to ask any questions about the contents of the book, such as difficulty in installation, etc. The erratum of books is also updated on the discussions page.

# Contributors
- Nguyen Tuan Hung
- Ahmad Ridwan Tresna Nugraha
- Riichiro Saito

# Gruvbox Factory Nix Package

A Nix package for [Gruvbox Factory](https://github.com/paulopacitti/gruvbox-factory), a CLI tool that converts images to use the Gruvbox color palette.

## Description

This project packages the Gruvbox Factory CLI tool for NixOS, allowing users to easily convert images to use the eye-friendly Gruvbox color scheme. The package was created using `nix-init` and serves as an example of creating Python-based Nix packages.

## Prerequisites

- NixOS or Nix package manager installed
- Basic understanding of Nix packaging

## Installation

1. Clone this repository:

```bash
git clone https://github.com/thein3rovert/nixified-gruvbox-factory.git
cd gruvbox-factory-nix
```

2. Build the package:

```bash
nix build \
  --impure --expr \
  'let pkgs = import <nixpkgs> { }; in pkgs.callPackage ./default.nix {}'
```

## Usage

After building, you can use the package in a Nix shell:

```bash
nix develop -c $SHELL
```

Then run the tool:

```bash
gruvbox-factory -h

# Basic usage
gruvbox-factory -i [path-to-image] -p [palette-choice]

# Available palettes
# - white
# - pink (default)
# - mix
```

## Project Structure

```
.
├── default.nix        # Main Nix package configuration
├── flake.nix         # Nix flake configuration
├── flake.lock        # Lock file for dependencies
└── README.md         # This file
```

## Development Notes

### Dependencies

The package handles the following Python dependencies:

- numpy (≥ 2.2.2)
- setuptools (≥ 75.8.0)

### Known Issues

When exiting the Nix shell, the package becomes unavailable. This is expected behavior in development mode.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under [Your License] - see the LICENSE file for details.

## Acknowledgments

- [Paulo Pacitti](https://github.com/paulopacitti) for creating the original Gruvbox Factory
- [Li Yang](https://tech.aufomm.com/my-nix-journey-how-to-use-nix-to-set-up-dev-environment/) for the helpful Nix packaging guide
- The Nix community for creating and maintaining `nix-init`

## Author

thein3rovert

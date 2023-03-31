#!/bin/bash

# I don't know how setup.py stuff works, so having a script here is probably NOT the way to go about it.

# Run me to install the stuff required for local development!
pip install -r ./requirements-bootstrap.txt

# Install pre-commit hooks
nbdev_install_hooks

# check to see if quarto is installed

# Create a function called foo that prints "bar":
if ! command -v quarto &> /dev/null
then
    echo "quarto could not be found, installing it now. You will be prompted for sudo password:"
    # Yeah, it's weird that we need sudo, but there you go:
    sudo nbdev_install_quarto
else
    echo "quarto is already installed, so will skip install. To reinstall, run: nbdev_install_quarto"
fi

# Check to see if the VSCode code command exists:
if command -v code &> /dev/null
then
    echo "Installing VSCode extension 'nbdev-vscode'"
    # VScode extension (can't have it use the marketplace yet, so we have to download it from github)
    ./scripts/install_nbdev-vscode-extension.sh
else
    echo "VSCode not found. Skipping VSCode extension install."
fi

echo "Installing this package in editable mode. You can now import it from other python code."
test -f setup.py && pip install -e ".[dev]"

echo "nbdev and related stuff has been installed. To get started, run: 'code .' and look at index.ipynb"


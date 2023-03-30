#!/bin/bash

# Until this is published to the marketplace, we need to download it from github
# wget a file, call it nbdev-vscode.vsix, and  and Overwrite the existing file if it exists:
wget -O nbdev-vscode.vsix https://github.com/fastai/nbdev-vscode/raw/main/nbdev-0.0.1.vsix
code --install-extension nbdev-vscode.vsix

# TODO for the extension:
# - [ ] Create a compound task for restart the kernel and run-all
# - [ ] Create a task to run the preview and open the browser as a side-window 
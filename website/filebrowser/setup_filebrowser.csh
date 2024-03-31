#!/bin/bash

# Set FILEBROWSER_DIR to the directory the script is run from
FILEBROWSER_DIR="${PWD}"

echo "Current UID: $(id -u)"
echo "Current GID: $(id -g)"
echo "FileBrowser Directory: ${FILEBROWSER_DIR}"

mkdir -p "${FILEBROWSER_DIR}/data"
mkdir -p "${FILEBROWSER_DIR}/config"

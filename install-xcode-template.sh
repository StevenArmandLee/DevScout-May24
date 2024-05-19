#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/SMB'
STD_XCODE_SRC_TEMPLATE_DIR="$(xcode-select -p)/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy SMBs file templates into the local SMBs template directory
__copy_SMB_templates() {
  echo "==> Copying up SMB Xcode file templates..."
  mkdir -p "${XCODE_TEMPLATE_DIR}/"
  local origin="${SCRIPT_DIR}/SMB/"
  local destination="${XCODE_TEMPLATE_DIR}/"
  rsync -a --delete "${origin}" "${destination}"
  echo "==> ... success!"
  echo "==> SMBs have been set up. In Xcode, select 'New File...' to use SMBs templates."
}

# TODO: - Steven Lee, to update unit test templates once available


main() {
  __copy_SMB_templates
}

main

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -eq 1 ]; then
   if [ ! -d "$1" ]; then
      echo "Could not find plugin directory $1" >&2
      exit 1
   fi
   export LINUX_CONFIG_PLUGIN_DIR="$(cd "$1" && pwd)"
fi

source ${DIR}/functions.sh
if [ -f ${LINUX_CONFIG_PLUGIN_DIR}/custom_uninstall.sh ]
then
   ${LINUX_CONFIG_PLUGIN_DIR}/custom_uninstall.sh
fi
rm -rf ~/.oh-my-zsh
remove_files
rm -rf ~/.vim*
rm -rf ~/.tmux


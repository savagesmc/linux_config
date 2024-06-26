#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

verlte() {
   s="`echo -e "$1\n$2" | sort -V | head -n 1`"
   [ "$1" = "$s" ]
}

verlt() {
   [ "$1" = "$2" ] && return 1 || verlte $1 $2
}

dot_files=$(find ${DIR}/dot_files -type f)
scripts=$(find ${DIR}/scripts -type f)

if [ ! -z ${LINUX_CONFIG_PLUGIN_DIR} ]; then
   if [ -d ${LINUX_CONFIG_PLUGIN_DIR}/dot_files ]; then
      dot_files+=($(find ${LINUX_CONFIG_PLUGIN_DIR}/dot_files -type f))
   fi
   if [ -d ${LINUX_CONFIG_PLUGIN_DIR}/scripts ]; then
      scripts+=($(find ${LINUX_CONFIG_PLUGIN_DIR}/scripts -type f))
   fi
fi

function install_files()
{
   for f in ${dot_files[@]}
   do
      ln -sf ${f} ~/.$(basename ${f})
   done

   mkdir -p ~/scripts
   for f in ${scripts[@]}
   do
      ln -sf ${f} ~/scripts/$(basename ${f})
   done
}

function remove_files()
{
   for f in ${dot_files[@]}
   do
      rm -f ~/.$(basename ${f})
   done

   for f in ${scripts[@]}
   do
      rm -f ~/scripts/$(basename ${f})
   done
}



function get_platform {
   if [[ `uname -a ` =~ "Microsoft" ]]; then
     echo "WSL"
   elif [[ `uname -a ` =~ "microsoft" ]]; then
     echo "WSL2"
   elif [[ `uname -a ` =~ "Darwin" ]]; then
     echo "OSX"
   elif [[ `uname -a ` =~ "Linux" ]]; then
     echo "LINUX"
   else
     echo "CYGWIN"
   fi
}


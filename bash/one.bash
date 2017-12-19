
TLX_VER () {
  declare -x TLXHOME="/opt/TLX/tlx$1"
}

tlx_ver () {
  if [ -z $1 ]
  then
    echo "Need to specify TLXHOME version (e.g. 4.1)"
  else if [ $1 == "4.0" ]
  then
    echo "setting TLXHOME $1"
  else if [ $1 == "4.1" ]
  then
    echo "setting TLXHOME $1"
  else
    echo "Error setting TLXHOME $1"
  fi
  declare -x TLXHOME="/opt/TLX/tlx$1"
}


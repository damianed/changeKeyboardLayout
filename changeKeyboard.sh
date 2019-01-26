set -e
currentLayout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
if [[ $# == 1 ]]
then
  readarray langs < $1
  flag=0
  for lang in ${langs[@]}
  do
    echo "$lang"
    if [[ $flag == 1 ]]
   then
      $(setxkbmap "$lang")
      exit 0
    else
      if [[ "$currentLayout" == "$lang" ]]
      then
        flag=1
      fi
    fi
  done
  #if the script is still running that means the current layout isn't
  #in the file or is the last one, so we just set it to the first element in the list
  $(setxkbmap "${langs[0]}")
  exit 0
else
  if [[ $# == 0 ]]
  then
    if [[ "$currentLayout" == "us" ]]
    then
      $(setxkbmap latam)
    else
      $(setxkbmap us)
    fi
  else
    echo "This script can only take 0 or 1 parameters"
  fi
fi


currentKey=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
if [[ "$currentKey" == "us" ]]
then
  $(setxkbmap latam)
else
  $(setxkbmap us)
fi

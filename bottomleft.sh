while true
do
  clear && printf '\e[3J'
  maestral log show | tail -10
  sleep 2
done
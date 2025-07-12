int_handler() {
  echo "Killing"
  sudo killall ydotoold
  exit 1
}
trap 'int_handler' INT

sudo ydotoold &
while true; do
  sleep 50
  sudo ydotool key 125:1 125:0

done

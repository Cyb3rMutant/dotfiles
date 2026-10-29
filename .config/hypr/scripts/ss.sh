#!/usr/bin/env bash
# usage: ss.sh region|full clip|file
#   region shows quickshell's animated selection, which calls back into this
#   script once you let go: ss.sh geometry "<x,y wxh>" clip|file

DIR="$HOME/Pictures/Screenshots"
dest=${2:-clip}

case $1 in
	region)
		echo "geom $dest" | socat - UNIX-CONNECT:/tmp/quickshell_zephyr.sock
		exit
		;;
	full)
		# the screen you're on
		args=(-o "$(hyprctl -j activeworkspace | jq -r .monitor)")
		;;
	geometry)
		args=(-g "$2")
		dest=$3
		;;
	*)
		echo "usage: $0 region|full clip|file" >&2
		exit 1
		;;
esac

if [ "$dest" = file ]; then
	mkdir -p "$DIR"
	f="$DIR/$(date +%F_%H-%M-%S-%3N).png"
	grim "${args[@]}" "$f" && notify-send -a ss "Screenshot saved" "$f"
else
	grim "${args[@]}" - | wl-copy --type image/png && notify-send -a ss "Screenshot copied to clipboard"
fi

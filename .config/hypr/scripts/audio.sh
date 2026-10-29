#!/usr/bin/env bash
# wofi menu to pick the default output and input device (super+a).
# sound that's already playing moves to the new device

# one line per device: kind <tab> label <tab> pactl name.
# skips monitors and anything whose port says it's unplugged
devices() {
	local kind=$1 default
	default=$(pactl "get-default-$kind")
	pactl -f json list "${kind}s" | jq -r --arg kind "$kind" --arg default "$default" '
		.[]
		| select(.name | endswith(".monitor") | not)
		| (.active_port) as $port
		| (.ports // [] | map(select(.name == $port)) | first) as $p
		| select(($p.availability // "") != "not available")
		| ($p.description // .description) as $label
		| [$kind, (if .name == $default then "● " else "   " end) + $label, .name, $label]
		| @tsv'
}

list=$( (devices sink; devices source) | awk -F'\t' '{ printf "%s\t%s %s\t%s\t%s\n", $1, ($1 == "sink" ? "OUT" : "IN "), $2, $3, $4 }')

choice=$( (cut -f2 <<<"$list"; echo "    open pavucontrol") | wofi --dmenu -i --prompt audio)
[ -z "$choice" ] && exit

if [ "$choice" = "    open pavucontrol" ]; then
	exec pavucontrol
fi

IFS=$'\t' read -r kind _ name label < <(awk -F'\t' -v c="$choice" '$2 == c' <<<"$list")
[ -n "$name" ] && pactl "set-default-$kind" "$name" && notify-send -a audio "Audio" "$label"

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload bar0 &
	done
else
	polybar --reload bar0 &
fi

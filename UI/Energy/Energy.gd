tool
extends TextureRect

export var value = 2000
export var max_value = 2000

var Effect_Up = true

func _process(delta):
	if value < 0:value = 0
	if value > max_value:value = max_value 
	#data assigning
	$Progress.max_value = max_value
	$Progress.value = value
	
	var ratio = float(value) / max_value
	
	if ratio < 0.5:
		$Progress.tint_progress.g = 2 * ratio
	else:
		$Progress.tint_progress.g = 1
	#effect
	if value < max_value /100 * 10:
		if Effect_Up:$Progress.tint_progress.a8 += 10
		else:$Progress.tint_progress.a8 -= 10
		if $Progress.tint_progress.a8 >= 255: Effect_Up = false
		if $Progress.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Progress.tint_progress.a8 = 255

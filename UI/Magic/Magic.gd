tool
extends TextureButton

export var value = 20
export var max_value = 20

var Effect_Up = true

func _process(delta):
	if value < 0:value = 0
	if value > max_value:value = max_value 
	#data assigning
	$Progress.max_value = max_value
	$Progress.value = value
	
	var ratio = float(value) / max_value
	
	$Progress.tint_progress.r = ratio
	#effect
	if value < max_value /100 * 10:
		if Effect_Up:$Progress.tint_progress.a8 += 10
		else:$Progress.tint_progress.a8 -= 10
		if $Progress.tint_progress.a8 >= 255: Effect_Up = false
		if $Progress.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Progress.tint_progress.a8 = 255

tool
extends TextureRect

export var value = 50

var Effect_Up = true

func _process(delta):
	if value < 0:value = 0
	if value > 100:value = 100
	$Cold.value = value
	$Hot.value = value
	
	if value <= 25:
		if Effect_Up:$Cold.tint_progress.a8 += 10
		else:$Cold.tint_progress.a8 -= 10
		if $Cold.tint_progress.a8 >= 255: Effect_Up = false
		if $Cold.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Cold.tint_progress.a8 = 255
	if value >= 75:
		if Effect_Up:$Hot.tint_progress.a8 += 10
		else:$Hot.tint_progress.a8 -= 10
		if $Hot.tint_progress.a8 >= 255: Effect_Up = false
		if $Hot.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Hot.tint_progress.a8 = 255

tool
extends TextureButton

export var capacity = 100
export var value = 100

var Effect_Up = true

func _process(delta):
	$Normal.max_value = capacity
	$Burdened.max_value = capacity
	$Stressed.max_value = capacity / 2
	
	if value < 0:value = 0
	if value > capacity * 2.5:value = capacity * 2.5
	
	$Normal.value = value
	$Burdened.value = value - capacity
	$Stressed.value = value - capacity * 2
	
	if Effect_Up:$Stressed.tint_progress.a8 += 10
	else:$Stressed.tint_progress.a8 -= 10
	if $Stressed.tint_progress.a8 >= 255: Effect_Up = false
	if $Stressed.tint_progress.a8 <= 0: Effect_Up = true

tool
extends TextureButton

#external data
export var Value = 0
export(Texture) var Icon
export var Col = Color(1,1,1,1)
export var Upgradeable = true

signal OnUp

func _process(delta):
	#data assigning
	$Icon.texture = Icon
	$Value.text = str(Value)
	
	#effect
	var Step = 0.05
	if $Icon.self_modulate.r - Col.r > Step:
		$Icon.self_modulate.r -= Step
	elif $Icon.self_modulate.r - Col.r < -Step:
		$Icon.self_modulate.r += Step
	else:
		$Icon.self_modulate.r = Col.r
	if $Icon.self_modulate.g - Col.g > Step:
		$Icon.self_modulate.g -= Step
	elif $Icon.self_modulate.g - Col.g < -Step:
		$Icon.self_modulate.g += Step
	else:
		$Icon.self_modulate.g = Col.g
	if $Icon.self_modulate.b - Col.b > Step:
		$Icon.self_modulate.b -= Step
	elif $Icon.self_modulate.b - Col.b < -Step:
		$Icon.self_modulate.b += Step
	else:
		$Icon.self_modulate.b = Col.b

func _On_Up():
	if Upgradeable == true:
		$Icon.self_modulate = Color(1,1,1,1)
		emit_signal("OnUp")

tool
extends TextureRect

export var HP = 0.0
export var Max_HP = 40.0

func _process(delta):
	#value assigning & bounding
	if HP>Max_HP:HP = Max_HP
	if HP<0:HP = 0
	$HP.max_value = Max_HP
	$HP.value = HP
	
	#Bar color
	var ratio = HP / Max_HP 
	var Col = $HP.get("custom_styles/fg")
	if ratio>0.5:
		$HP.get("custom_styles/fg").modulate_color.r = (1 - ratio) * 2
		$HP.get("custom_styles/fg").modulate_color.g = 1
	else:
		Col.modulate_color.r = 1
		Col.modulate_color.g = 2 * ratio
	
	#HP sudden drop effect
	if $HPEffect.value - ratio > 0.0075:
		$HPEffect.value -= 0.0075
	elif $HPEffect.value - ratio < -0.0075:
		$HPEffect.value += 0.0075
	else:
		$HPEffect.value = ratio
		

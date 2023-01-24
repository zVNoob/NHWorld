tool
extends TextureRect

export var Max_Faint = 100
export var Max_Norm = 1000
export var Max_Satiate = 500
export var value = 1100

var Effect_Up = true

func _process(delta):
	#value bound
	if value < 0:
		value = 0
	if value > Max_Faint + Max_Norm + Max_Satiate:
		value = Max_Faint + Max_Norm + Max_Satiate
	#data assigning
	$Fainting.max_value = Max_Faint
	$Normal.max_value = Max_Norm
	$Satiated.max_value = Max_Satiate
	
	$Fainting.value = value
	$Normal.value = value - Max_Faint
	$Satiated.value = value - Max_Faint - Max_Norm
	
	if $Fainting.value < Max_Faint:
		if Effect_Up:$Fainting.tint_progress.a8 += 10
		else:$Fainting.tint_progress.a8 -= 10
		if $Fainting.tint_progress.a8 >= 255: Effect_Up = false
		if $Fainting.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Fainting.tint_progress.a8 = 255
	if $Satiated.value > 0:
		if Effect_Up:$Satiated.tint_progress.a8 += 10
		else:$Satiated.tint_progress.a8 -= 10
		if $Satiated.tint_progress.a8 >= 255: Effect_Up = false
		if $Satiated.tint_progress.a8 <= 0: Effect_Up = true
	else:
		$Satiated.tint_progress.a8 = 255
	

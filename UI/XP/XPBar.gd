
extends TextureRect

#property level
export var STR = 0
export var INT = 0
export var DEX = 0
export var AGI = 0
export var VIT = 0
export var CON = 0

#XP
export var Level = 0
export var XP = 0.0
export var GainedXP = 0.0

#Upgrade
export var Available = 0
var Effect_Up = true

#Dropdown
var IsDropDown = false

#Asset preload
var XP_Norm = preload("res://UI/XP/XP_Norm.svg")
var XP_Up = preload("res://UI/XP/XP_Up.svg")
var XP_DropDown = preload("res://UI/XP/XP_DropDown.svg")


func _process(delta):
	#Varible declaration
	var MaxXP = 10 * pow(1.1,Level)

	#Data modification
	if GainedXP > 0:
		if GainedXP > float(MaxXP) / 100 * 1.5:
			GainedXP -= float(MaxXP) / 100 * 1.5
			XP += float(MaxXP) / 100 * 1.5
		else:
			XP += GainedXP
			GainedXP = 0
		if XP > MaxXP:
			XP -= MaxXP
			Level += 1
			MaxXP *= 1.1
			Available += max(int(sqrt(Level/2)/2),1)

	#Data assigning
	if XP > MaxXP:XP = MaxXP
	if XP < 0:XP = 0
	$Progress.max_value = MaxXP
	$Progress.value = XP
	$Menu.STR = STR
	$Menu.AGI = AGI
	$Menu.VIT = VIT
	$Menu.INT = INT
	$Menu.DEX = DEX
	$Menu.CON = CON
	$Menu.Level = Level
	$Menu.Available = Available
	
	#Upgrade available effect
	$Menu.visible = IsDropDown
	if IsDropDown == false:
		if Available > 0:
			$Icon.texture_normal = XP_Up
			if Effect_Up == true:$Icon.self_modulate.a8 += 3
			else:$Icon.self_modulate.a8 -= 3
			if $Icon.self_modulate.a8 >= 255:Effect_Up = false
			if $Icon.self_modulate.a8 <= 0:Effect_Up = true
		else:
			$Icon.texture_normal = XP_Norm
			$Icon.self_modulate.a8 = 255
	else:
		$Icon.texture_normal = XP_DropDown
		$Icon.self_modulate.a8 = 255

func _OnDropDown():
	IsDropDown = !IsDropDown

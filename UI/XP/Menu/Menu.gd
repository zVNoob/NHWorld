tool
extends TextureRect

signal STR
signal INT
signal DEX
signal AGI
signal VIT
signal CON

export var STR = 0
export var INT = 0
export var DEX = 0
export var AGI = 0
export var VIT = 0
export var CON = 0

#XP
export var Level = 0

#Upgrade
export var Available = 0

func _process(delta):
	#data assigning
	$STR.Value = STR
	$INT.Value = INT
	$DEX.Value = DEX
	$AGI.Value = AGI
	$VIT.Value = VIT
	$CON.Value = CON
	$Level/Value.text = str(Level)
	$Upgrade/Value.text = str(Available)
	
	#Upgradable
	$STR.Upgradeable = Available > 0
	$INT.Upgradeable = Available > 0
	$DEX.Upgradeable = Available > 0
	$AGI.Upgradeable = Available > 0
	$VIT.Upgradeable = Available > 0
	$CON.Upgradeable = Available > 0



func _on_STR_OnUp():
	emit_signal("STR")

func _on_INT_OnUp():
	emit_signal("INT")

func _on_DEX_OnUp():
	emit_signal("DEX")

func _on_AGI_OnUp():
	emit_signal("AGI")

func _on_VIT_OnUp():
	emit_signal("VIT")

func _on_CON_OnUp():
	emit_signal("CON")

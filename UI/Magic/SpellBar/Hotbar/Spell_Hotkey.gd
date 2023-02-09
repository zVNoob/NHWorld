tool
extends TextureButton


var MP_Holder : TextureButton
var SpellHolder : Node2D
var Res : Resource

func SetData(a,b):
	MP_Holder = a
	SpellHolder = b
	
func _ready():
	$Hotkey/Key.text = name

func _process(delta):
	
	if Res != null:
		if MP_Holder != null:
			$Out_MP.visible = MP_Holder.value < Res.MP
		$CD.max_value = Res.CooldownMax
		$CD.value = Res.Cooldown
		$Memory.max_value = Res.Max_Memory
		$Memory.value = Res.Memory
		$Icon.texture = Res.Img
		var ratio = float($Memory.value) / $Memory.max_value
		if ratio>0.5:
			$Memory.tint_progress.r = (1 - ratio) * 2
			$Memory.tint_progress.g = 1
		else:
			$Memory.tint_progress.r = 1
			$Memory.tint_progress.g = 2 * ratio
		$Memory.visible = true
	else:
		$CD.max_value = 0
		$CD.value = 0
		$Icon.texture = null
		$Memory.visible = false
		$Out_MP.visible = true

func _on_Spell_button():
	var temp = Res
	Res = SpellHolder.Res
	SpellHolder.Res = temp


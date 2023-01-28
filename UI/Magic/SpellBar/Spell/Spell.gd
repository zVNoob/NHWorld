tool
extends TextureButton

var MP_Holder : TextureButton
export var Res : Resource

func SetData(a):
	MP_Holder = a
	
func _process(delta):
	if Res != null:
		if MP_Holder != null:
			$Out_MP.visible = MP_Holder.value < Res.MP
		$CD.max_value = Res.CooldownMax
		$CD.value = Res.Cooldown

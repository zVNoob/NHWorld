tool
extends TextureButton


var MP_Holder : TextureButton
var Res : Resource

func SetData(a):
	MP_Holder = a
	

func _process(delta):
	$Hotkey/Key.text = name
	if Res != null:
		if MP_Holder != null:
			$Out_MP.visible = MP_Holder.value < Res.MP

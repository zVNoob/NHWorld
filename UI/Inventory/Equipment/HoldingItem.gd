extends Node2D

export var Res : Resource


export var IsSlot = false

signal DropItem(Item)

func _process(delta):
	if Res != null:
		$Img.texture_normal = Res.texture
		if Res.stack_size > 1:
			$Size.text = str(Res.stack_size)
			$Size.visible = true
		else:
			$Size.visible = false
		
		global_position = get_global_mouse_position()
	else:
		$Size.visible = false
		$Img.texture_normal = null



func _on_Img_pressed():
	if not IsSlot:
		emit_signal("DropItem",Res)
		Res = null

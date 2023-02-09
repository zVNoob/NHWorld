extends Node2D

export(Resource) var Res

func _process(delta):
	$Spell.Res = Res
	visible = Res != null
	if Res != null:
		global_position = get_global_mouse_position()

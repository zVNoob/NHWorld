extends GridContainer

signal OnExpand

func _on_Expand_pressed():
	emit_signal("OnExpand")

extends TextureRect

func _ready():
	for i in $DropBox/Grid.get_children():
		i.SetData(get_parent())
	for i in range(5):
		$Spell_Hotbar.get_child(i).SetData(get_parent())


func _on_Spell_Hotbar_OnExpand():
	$DropBox.visible = ! $DropBox.visible

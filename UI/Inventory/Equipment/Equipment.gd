extends TextureRect

signal DropItem(Item)

func _ready():
	var temp = get_child(0)
	for i in range(1,get_child_count()):
		get_child(i).SetData(temp)
		

func _process(delta):
	pass



func _DropItem(Item):
	emit_signal("DropItem",Item)

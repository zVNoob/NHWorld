extends Resource
class_name BaseItemResource

export var name : String
export var texture : Texture
export var stackable = false
export var stack_size = 1
export var Max_HP = 1
export var HP = 1
export var Weight : float

enum ItemType { GENERIC,
				EQUIP_HAT,
				EQUIP_AMULET,
				EQUIP_BODY,
				EQUIP_RING,
				EQUIP_GAUNTLET,
				EQUIP_BOOT,
				EQUIP_BAG,
				EQUIP_CLOAK,
				EQUIP_GLASSES
			}

export(ItemType) var Type 

func on_take(equipper : Node,slot : TextureButton):
	return true
	
func on_drop():
	return true

func on_equip():
	return true

func on_unequip():
	return true

func on_use(user : Node):
	pass

func on_stopuse():
	pass

func process(delta:float):
	pass

func on_config():
	pass

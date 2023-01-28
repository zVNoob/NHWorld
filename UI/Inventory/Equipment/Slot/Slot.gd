tool
extends TextureButton

export var BG : Texture
export var Res : Resource
export(BaseItemResource.ItemType) var AcceptableType
var Holder : Node2D

var Focusing = false

func _process(delta):
	$BG.texture = BG
	if !Focusing:
		$Border.self_modulate.r8 = 255
		$Border.self_modulate.g8 = 255
		$Border.self_modulate.b8 = 255

	if Res != null:
		$BG.visible = false
		$Icon.texture = Res.texture
		$HP.visible = Res.HP != Res.Max_HP
		$HP.max_value = Res.Max_HP
		$HP.value = Res.HP
		#Bar color
		var ratio = float(Res.HP) / Res.Max_HP 

		if ratio>0.5:
			$HP.tint_progress.r = (1 - ratio) * 2
			$HP.tint_progress.g = 1
		else:
			$HP.tint_progress.r = 1
			$HP.tint_progress.g = 2 * ratio
		
		if Res.stack_size > 1:
			$Size.text = str(Res.stack_size)
			$Size.visible = true
		else:
			$Size.visible = false
	else:
		if not Focusing:
			$Border.self_modulate.r8 = 200
			$Border.self_modulate.g8 = 200
			$Border.self_modulate.b8 = 200
		$Size.visible = false
		$HP.visible = false
		$Icon.texture = null
		$BG.visible = true


func SetData(In:Node2D):
	Holder = In

func _on_Slot_button():
	if Holder.Res == null:
		Holder.Res = Res
		Res = null
	else:
		if AcceptableType == BaseItemResource.ItemType.GENERIC \
		|| Holder.Res.Type == AcceptableType:
			var temp = Holder.Res
			Holder.Res = Res
			Res = temp

func _on_Slot_mouse_entered():
	if Holder.Res!=null:
		Focusing = true
		if AcceptableType == BaseItemResource.ItemType.GENERIC \
		|| Holder.Res.Type == AcceptableType:
			$Border.self_modulate.r8 = 50
			$Border.self_modulate.g8 = 255
			$Border.self_modulate.b8 = 50
		else:
			$Border.self_modulate.r8 = 255
			$Border.self_modulate.g8 = 50
			$Border.self_modulate.b8 = 50
	Holder.IsSlot = true

func _on_Slot_mouse_exited():
	Focusing = false
	Holder.IsSlot = false


func _on_Config():
	if Res != null:
		Res.on_config()

extends Control

export var Spell = Array()

var Spell_Obj = preload("res://UI/Magic/SpellBar/Spell/Spell.tscn")

func _ready():
	for i in range(5):
		$Spell_Hotbar.get_child(i).SetData(get_parent(),get_child(0))
	for i in range(min(5,Spell.size())):
		$Spell_Hotbar.get_child(i).Res = Spell[i]
	for i in range(max(0,Spell.size()-5)):
		var temp = Spell_Obj.instance()
		temp.SetData(get_parent(),get_child(0))
		temp.Res = Spell[i+5]
		$DropBox/Grid.add_child(temp)
	
func _on_Spell_Hotbar_OnExpand():
	$DropBox.visible = ! $DropBox.visible

func _process(delta):
	$Spell_Hotbar/Expand.visible = Spell.size()>5
	$BG/Minimal.visible = Spell.size()<6
	$BG/Top.visible = Spell.size()>5
	$BG/Mid.visible = Spell.size()>5
	$BG/Bot.visible = Spell.size()>5
	var sz = min((Spell.size()-5)/6,3)
	if !$DropBox.visible:sz = 0
	$BG/Bot.margin_top = 47+45*sz
	$BG/Mid.margin_bottom = 47+45*sz
	
func clear():
	for i in range(5):
		$Spell_Hotbar.get_child(i).Res = null
	for i in $DropBox/Grid.get_children():
		i.queue_free()

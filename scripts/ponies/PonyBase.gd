@tool
extends Node2D


func clear_pony() -> void:
	Globals.hide_children($Tails)
	Globals.hide_children($Cutiemarks)
	$Wing.hide()
	Globals.hide_children($Hairs)


func set_pony(pony: Globals.Ponies) -> void:
	clear_pony()
	match pony:
		Globals.Ponies.RD:
			$Tails/RD.show()
			$Cutiemarks/RD.show()
			$Wing.show()
			$Hairs/RD.show()
		Globals.Ponies.PP:
			$Tails/PP.show()
			$Cutiemarks/PP.show()
			$Hairs/PP.show()
		Globals.Ponies.TS:
			$Tails/TS.show()
			$Cutiemarks/TS.show()
			$Hairs/TS.show()
		Globals.Ponies.FS:
			$Tails/FS.show()
			$Cutiemarks/FS.show()
			$Wing.show()
			$Hairs/FS.show()
		Globals.Ponies.AJ:
			$Tails/AJ.show()
			$Cutiemarks/AJ.show()
			$Hairs/AJ.show()
		Globals.Ponies.RR:
			$Tails/RR.show()
			$Cutiemarks/RR.show()
			$Hairs/RR.show()
		Globals.Ponies.PO:
			$Tails/PO.show()
			$Cutiemarks/PO.show()
			$Hairs/PO.show()


func clear_emotion() -> void:
	Globals.hide_children($Eyes)
	Globals.hide_children($Mouths)


func set_emotion(emotion: Globals.PonyEmotion) -> void:
	clear_emotion()
	match emotion:
		Globals.PonyEmotion.Normal:
			$Eyes/Normal.show()
			$Mouths/Normal.show()
		Globals.PonyEmotion.Happy:
			$Eyes/Happy.show()
			$Mouths/Happy.show()
		Globals.PonyEmotion.Sad:
			$Eyes/Normal.show() # Intentional
			$Mouths/Sad.show()


func change_accessory_visibility(node_name: String, visibility: bool) -> void:
	var accessory: Node2D = $Accessories.get_node_or_null(node_name)
	if accessory != null:
		accessory.visible = visibility


func hide_accessory(node_name: String) -> void:
	change_accessory_visibility(node_name, false)


func show_accessory(node_name: String) -> void:
	change_accessory_visibility(node_name, true)

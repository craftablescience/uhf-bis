@tool
extends Node2D


func clear_flower() -> void:
	Globals.hide_children($UngrownGeneric)
	Globals.hide_children($UngrownTulip)
	Globals.hide_children($GrownGeneric)
	Globals.hide_children($GrownTulip)


func get_flower() -> Globals.FlowerType:
	if $"UngrownGeneric/1".visible or $"GrownGeneric/1".visible:
		return Globals.FlowerType.FLOWER_GENERIC_1
	if $"UngrownGeneric/2".visible or $"GrownGeneric/2".visible:
		return Globals.FlowerType.FLOWER_GENERIC_2
	if $"UngrownGeneric/3".visible or $"GrownGeneric/3".visible:
		return Globals.FlowerType.FLOWER_GENERIC_3
	if $"UngrownTulip/1".visible or $"GrownTulip/1".visible:
		return Globals.FlowerType.FLOWER_TULIP_1
	if $"UngrownTulip/2".visible or $"GrownTulip/2".visible:
		return Globals.FlowerType.FLOWER_TULIP_2
	if $"UngrownTulip/3".visible or $"GrownTulip/3".visible:
		return Globals.FlowerType.FLOWER_TULIP_3
	return Globals.FlowerType.FLOWER_GENERIC_1


func set_flower(flower: Globals.FlowerType, grown: bool) -> void:
	clear_flower()
	if not grown:
		match flower:
			Globals.FlowerType.FLOWER_GENERIC_1:
				$"UngrownGeneric/1".show()
			Globals.FlowerType.FLOWER_GENERIC_2:
				$"UngrownGeneric/2".show()
			Globals.FlowerType.FLOWER_GENERIC_3:
				$"UngrownGeneric/3".show()
			Globals.FlowerType.FLOWER_TULIP_1:
				$"UngrownTulip/1".show()
			Globals.FlowerType.FLOWER_TULIP_2:
				$"UngrownTulip/2".show()
			Globals.FlowerType.FLOWER_TULIP_3:
				$"UngrownTulip/3".show()
	else:
		match flower:
			Globals.FlowerType.FLOWER_GENERIC_1:
				$"GrownGeneric/1".show()
			Globals.FlowerType.FLOWER_GENERIC_2:
				$"GrownGeneric/2".show()
			Globals.FlowerType.FLOWER_GENERIC_3:
				$"GrownGeneric/3".show()
			Globals.FlowerType.FLOWER_TULIP_1:
				$"GrownTulip/1".show()
			Globals.FlowerType.FLOWER_TULIP_2:
				$"GrownTulip/2".show()
			Globals.FlowerType.FLOWER_TULIP_3:
				$"GrownTulip/3".show()

@tool
extends Node2D


func clear_flower_bed() -> void:
	Globals.hide_children(self)


func set_flower_bed(flower_bed: Globals.FlowerBedType) -> void:
	clear_flower_bed()
	match flower_bed:
		Globals.FlowerBedType.FLOWER_POT_WINDOW:
			$"1".show()
		Globals.FlowerBedType.FLOWER_BED:
			$"2".show()

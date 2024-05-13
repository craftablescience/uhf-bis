@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name FlowerBed2D


const FLOWER_BED_BASE: PackedScene = preload("res://scenes/sprites/FlowerBedBase.tscn")
var flower_bed: Node = null


@export var flower_bed_type: Globals.FlowerBedType = Globals.FlowerBedType.FLOWER_POT_WINDOW:
	set(new_flower_bed_type):
		flower_bed_type = new_flower_bed_type
		if flower_bed:
			flower_bed.set_flower_bed(flower_bed_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	flower_bed = FLOWER_BED_BASE.instantiate()
	add_child(flower_bed)
	flower_bed.set_flower_bed(flower_bed_type)

@tool
extends Node2D
class_name Flower2D


const FLOWER_BASE: PackedScene = preload("res://scenes/sprites/FlowerBase.tscn")
var flower: Node2D = null


@export var flower_type: Globals.FlowerType = Globals.FlowerType.FLOWER_GENERIC_1:
	set(new_flower_type):
		flower_type = new_flower_type
		if flower:
			flower.set_flower(flower_type, flower_grown)

@export var flower_grown := false:
	set(new_flower_grown):
		flower_grown = new_flower_grown
		if flower:
			flower.set_flower(flower_type, flower_grown)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	flower = FLOWER_BASE.instantiate()
	add_child(flower)
	flower.set_flower(flower_type, flower_grown)

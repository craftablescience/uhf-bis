@tool
extends Node2D
class_name Grass2D


const GRASS_BASE: PackedScene = preload("res://scenes/sprites/GrassBase.tscn")
var grass: Node2D = null


@export var grass_type: Globals.GrassType = Globals.GrassType.GRASS_1:
	set(new_grass_type):
		grass_type = new_grass_type
		if grass:
			grass.set_grass(grass_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	grass = GRASS_BASE.instantiate()
	add_child(grass)
	grass.set_grass(grass_type)

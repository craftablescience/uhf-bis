@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Hills2D


const HILLS_BASE: PackedScene = preload("res://scenes/sprites/HillsBase.tscn")
var hills: Array[Node] = []


@export_range(1, 100) var hills_length: int = 1:
	set(new_hills_length):
		hills_length = new_hills_length
		regenerate_hills()


func regenerate_hills() -> void:
	Globals.remove_children(self)
	hills.clear()
	
	for i in range(hills_length):
		var hills_instance: Sprite2D = HILLS_BASE.instantiate()
		hills_instance.position.x += hills_instance.get_rect().size.x / 2.01 * i
		add_child(hills_instance)
		hills.push_back(hills_instance)


func _ready() -> void:
	hills = []
	regenerate_hills()

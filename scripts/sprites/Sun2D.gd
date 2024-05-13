@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Sun2D


const SUN_BASE: PackedScene = preload("res://scenes/sprites/SunBase.tscn")
var sun: Node = null


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	sun = SUN_BASE.instantiate()
	add_child(sun)

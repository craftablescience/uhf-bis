@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Mountain2D


const MOUNTAIN_BASE: PackedScene = preload("res://scenes/sprites/MountainBase.tscn")
var mountain: Node = null


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	mountain = MOUNTAIN_BASE.instantiate()
	add_child(mountain)

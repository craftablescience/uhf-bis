@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Construction2D


const CONSTRUCTION_BASE: PackedScene = preload("res://scenes/sprites/ConstructionBase.tscn")
var construction: Node = null


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	construction = CONSTRUCTION_BASE.instantiate()
	add_child(construction)

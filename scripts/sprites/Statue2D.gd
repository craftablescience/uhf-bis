@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Statue2D


const STATUE_BASE: PackedScene = preload("res://scenes/sprites/StatueBase.tscn")
var statue: Node = null


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	statue = STATUE_BASE.instantiate()
	add_child(statue)

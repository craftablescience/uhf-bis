@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Rock2D


const ROCK_BASE: PackedScene = preload("res://scenes/sprites/RockBase.tscn")
var rock: Node = null


@export var rock_type: Globals.RockType = Globals.RockType.ROCK_1:
	set(new_rock_type):
		rock_type = new_rock_type
		if rock:
			rock.set_rock(rock_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	rock = ROCK_BASE.instantiate()
	add_child(rock)
	rock.set_rock(rock_type)

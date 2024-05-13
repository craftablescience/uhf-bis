@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Bush2D


const BUSH_BASE: PackedScene = preload("res://scenes/sprites/BushBase.tscn")
var bush: Node = null


@export var bush_type: Globals.BushType = Globals.BushType.BUSH_BLANK_1:
	set(new_bush_type):
		bush_type = new_bush_type
		if bush:
			bush.set_bush(bush_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	bush = BUSH_BASE.instantiate()
	add_child(bush)
	bush.set_bush(bush_type)

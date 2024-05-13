@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name PonyPath2D


const PONY_PATH_BASE: PackedScene = preload("res://scenes/sprites/PonyPathBase.tscn")
const PONY_PATH_SEPARATION := 682 #px
var pony_paths: Array[Node] = []


@export var pony_path_type: Globals.PonyPathType = Globals.PonyPathType.PATH_1:
	set(new_pony_path_type):
		pony_path_type = new_pony_path_type
		for pony_path in pony_paths:
			pony_path.set_pony_path(pony_path_type)

@export_range(1, 100) var pony_path_length: int = 1:
	set(new_pony_path_length):
		pony_path_length = new_pony_path_length
		regenerate_pony_paths()


func regenerate_pony_paths() -> void:
	Globals.remove_children(self)
	pony_paths.clear()
	pony_paths = []
	
	for i in range(pony_path_length):
		var pony_path_instance: Node2D = PONY_PATH_BASE.instantiate()
		pony_path_instance.position.x += PONY_PATH_SEPARATION * i
		add_child(pony_path_instance)
		pony_path_instance.set_pony_path(pony_path_type)
		pony_paths.push_back(pony_path_instance)


func _ready() -> void:
	pony_paths = []
	regenerate_pony_paths()

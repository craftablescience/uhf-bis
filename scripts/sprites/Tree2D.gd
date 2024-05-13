@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Tree2D


const TREE_BASE: PackedScene = preload("res://scenes/sprites/TreeBase.tscn")
var tree: Node = null


@export var tree_type: Globals.TreeType = Globals.TreeType.TREE_1:
	set(new_tree_type):
		tree_type = new_tree_type
		if tree:
			tree.set_tree(tree_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	tree = TREE_BASE.instantiate()
	add_child(tree)
	tree.set_tree(tree_type)

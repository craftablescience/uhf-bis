@tool
extends Node2D


func clear_tree() -> void:
	Globals.hide_children(self)


func set_tree(tree: Globals.TreeType) -> void:
	clear_tree()
	match tree:
		Globals.TreeType.TREE_1:
			$"1".show()

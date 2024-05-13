@tool
extends Node2D


func clear_pony_path() -> void:
	Globals.hide_children(self)


func set_pony_path(pony_path: Globals.PonyPathType) -> void:
	clear_pony_path()
	match pony_path:
		Globals.PonyPathType.PATH_1:
			$"1".show()
		Globals.PonyPathType.PATH_2:
			$"2".show()

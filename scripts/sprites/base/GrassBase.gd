@tool
extends Node2D


func clear_grass() -> void:
	Globals.hide_children(self)


func set_grass(grass: Globals.GrassType) -> void:
	clear_grass()
	match grass:
		Globals.GrassType.GRASS_1:
			$"1".show()
		Globals.GrassType.GRASS_2:
			$"2".show()
		Globals.GrassType.GRASS_3:
			$"3".show()
		Globals.GrassType.GRASS_4:
			$"4".show()

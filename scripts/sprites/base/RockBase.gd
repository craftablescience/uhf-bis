@tool
extends Node2D


func clear_rock() -> void:
	Globals.hide_children(self)


func set_rock(rock: Globals.RockType) -> void:
	clear_rock()
	match rock:
		Globals.RockType.ROCK_1:
			$"1".show()
		Globals.RockType.ROCK_2:
			$"2".show()
		Globals.RockType.ROCK_3:
			$"3".show()
		Globals.RockType.ROCK_4:
			$"4".show()
		Globals.RockType.ROCK_5:
			$"5".show()

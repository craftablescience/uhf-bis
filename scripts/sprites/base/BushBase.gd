@tool
extends Node2D


func clear_bush() -> void:
	Globals.hide_children($Blank)
	Globals.hide_children($Flowering)


func set_bush(bush: Globals.BushType) -> void:
	clear_bush()
	match bush:
		Globals.BushType.BUSH_BLANK_1:
			$"Blank/1".show()
		Globals.BushType.BUSH_BLANK_2:
			$"Blank/2".show()
		Globals.BushType.BUSH_BLANK_3:
			$"Blank/3".show()
		Globals.BushType.BUSH_FLOWERING_1:
			$"Flowering/1".show()
		Globals.BushType.BUSH_FLOWERING_2:
			$"Flowering/2".show()
		Globals.BushType.BUSH_FLOWERING_3:
			$"Flowering/3".show()

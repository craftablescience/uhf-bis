@tool
extends Node


enum BushType {
	BUSH_BLANK_1,
	BUSH_BLANK_2,
	BUSH_BLANK_3,
	BUSH_FLOWERING_1,
	BUSH_FLOWERING_2,
	BUSH_FLOWERING_3,
}


enum FlowerBedType {
	FLOWER_POT_WINDOW,
	FLOWER_BED,
}


enum FlowerType {
	FLOWER_GENERIC_1,
	FLOWER_GENERIC_2,
	FLOWER_GENERIC_3,
	FLOWER_TULIP_1,
	FLOWER_TULIP_2,
	FLOWER_TULIP_3,
}


enum GrassType {
	GRASS_1,
	GRASS_2,
	GRASS_3,
	GRASS_4,
}


enum Ponies {
	RD,
	PP,
	TS,
	FS,
	AJ,
	RR,
	PO, # Purple Orchid
}


enum PonyBody {
	NORMAL,
	WALKING,
}


enum PonyEmotion {
	NORMAL,
	HAPPY,
	SAD,
}


enum RockType {
	ROCK_1,
	ROCK_2,
	ROCK_3,
	ROCK_4,
	ROCK_5,
}


enum TreeType {
	TREE_1,
}


func hide_children(parent: Node) -> void:
	for child in parent.get_children():
		child.hide()


func remove_children(parent: Node) -> void:
	for child in parent.get_children():
		parent.remove_child(child)
		child.queue_free()

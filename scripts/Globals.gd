@tool
extends Node


enum Ponies {
	RD,
	PP,
	TS,
	FS,
	AJ,
	RR,
	PO, # Purple Orchid
}


enum PonyEmotion {
	Normal,
	Happy,
	Sad,
}


func hide_children(parent: Node) -> void:
	for child in parent.get_children():
		child.hide()

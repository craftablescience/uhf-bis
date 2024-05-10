@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Pony2D

const PONY_BASE: PackedScene = preload("res://scenes/ponies/PonyBase.tscn")
var pony: Node2D = null


@export var pony_type: Globals.Ponies = Globals.Ponies.RD:
	set(new_pony_type):
		pony_type = new_pony_type
		if pony:
			pony.set_pony(pony_type)

@export var pony_emotion: Globals.PonyEmotion = Globals.PonyEmotion.NORMAL:
	set(new_pony_emotion):
		pony_emotion = new_pony_emotion
		if pony:
			pony.set_emotion(pony_emotion)

@export var pony_body: Globals.PonyBody = Globals.PonyBody.NORMAL:
	set(new_pony_body):
		pony_body = new_pony_body
		if pony:
			pony.set_body(pony_body)


func hide_accessory(node_name: String) -> void:
	if pony:
		pony.hide_accessory(node_name)


func show_accessory(node_name: String) -> void:
	if pony:
		pony.show_accessory(node_name)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	pony = PONY_BASE.instantiate()
	add_child(pony)
	pony.set_pony(pony_type)
	pony.set_emotion(pony_emotion)
	pony.set_body(pony_body)

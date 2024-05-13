@tool
@icon("res://textures/editor/Pony2D.png")
extends Node2D
class_name Cloud2D


const CLOUD_BASE: PackedScene = preload("res://scenes/sprites/CloudBase.tscn")
var cloud: Node = null


@export var cloud_type: Globals.CloudType = Globals.CloudType.CLOUD_1:
	set(new_cloud_type):
		cloud_type = new_cloud_type
		if cloud:
			cloud.set_cloud(cloud_type)


func _ready() -> void:
	if Engine.is_editor_hint():
		Globals.remove_children(self)
	
	cloud = CLOUD_BASE.instantiate()
	add_child(cloud)
	cloud.set_cloud(cloud_type)

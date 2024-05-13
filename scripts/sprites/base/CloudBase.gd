@tool
extends Node2D


func clear_cloud() -> void:
	Globals.hide_children(self)


func set_cloud(cloud: Globals.CloudType) -> void:
	clear_cloud()
	match cloud:
		Globals.CloudType.CLOUD_1:
			$"1".show()
		Globals.CloudType.CLOUD_2:
			$"2".show()
		Globals.CloudType.CLOUD_3:
			$"3".show()

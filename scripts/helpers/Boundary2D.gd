@tool
class_name Boundary2D
extends Node2D


func _draw() -> void:
	if Engine.is_editor_hint():
		draw_rect(Rect2(Vector2(-640,0), Vector2(1280, 720)), Color.ORANGE, false, 4)
		draw_line(Vector2(0,0), Vector2(0,720), Color.ORANGE, 3)

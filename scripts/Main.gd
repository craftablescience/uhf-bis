extends Control


var menu_is_visible := true
var menu_visibility_is_changing := false


func set_menu_visibility(visibility: bool) -> void:
	if menu_visibility_is_changing or (menu_is_visible and visibility) or (not menu_is_visible and not visibility):
		return
	menu_visibility_is_changing = true
	
	var tween := get_tree().create_tween().bind_node(self)
	tween.tween_property($MenuViewportContainer.material, "shader_parameter/dissolve_value", 1.0 if visibility else 0.0, 1.5)
	tween.play()
	await tween.finished
	
	menu_is_visible = visibility
	menu_visibility_is_changing = false
	get_tree().paused = menu_is_visible
	$MenuViewportContainer.mouse_filter = MOUSE_FILTER_PASS if menu_is_visible else MOUSE_FILTER_IGNORE


func hide_menu() -> void:
	await set_menu_visibility(false)


func show_menu() -> void:
	await set_menu_visibility(true)


func _ready() -> void:
	get_tree().paused = true


func _process(_delta: float) -> void:
	# HACK: for some reason the menu moves offscreen when the player camera moves...
	$MenuViewportContainer.position = $Game/PlayerCamera.position - Vector2(1280.0 / 2, 720.0 / 2)
	
	if Input.is_action_just_pressed("int_pause"):
		show_menu()


func _on_menu_start_game() -> void:
	hide_menu()

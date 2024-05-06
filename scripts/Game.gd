extends Control


enum FlipDirection {
	Left,
	Right,
}


var player_is_flipping := false
var player_direction := FlipDirection.Right


func flip_pony(object: Pony2D, direction: FlipDirection, should_tween: bool) -> void:
	if not should_tween:
		match direction:
			FlipDirection.Left:
				object.scale.x = abs(object.scale.x)
			FlipDirection.Right:
				object.scale.x = -abs(object.scale.x)
		return
	
	var original_scale = abs(object.scale.x)
	match direction:
		FlipDirection.Left:
			var tween := get_tree().create_tween().bind_node(self)
			for i in range(6):
				tween.tween_interval(0.33333 / 6)
				tween.tween_callback(func():
					object.scale.x += 0.33333 * original_scale)
			tween.tween_callback(func():
				object.scale.x = original_scale)
			tween.play()
			await tween.finished
		FlipDirection.Right:
			var tween := get_tree().create_tween().bind_node(self)
			for i in range(6):
				tween.tween_interval(0.33333 / 6)
				tween.tween_callback(func():
					object.scale.x -= 0.33333 * original_scale)
			tween.tween_callback(func():
				object.scale.x = -original_scale)
			tween.play()
			await tween.finished


func _process(_delta: float) -> void:
	if player_is_flipping:
		return
	
	var left = Input.is_action_pressed("mv_left")
	var right = Input.is_action_pressed("mv_right")
	if (left and right) or (not left and not right):
		return
	
	player_is_flipping = true
	if left and player_direction != FlipDirection.Left:
		await flip_pony($Player, FlipDirection.Left, true)
		player_direction = FlipDirection.Left
	elif right and player_direction != FlipDirection.Right:
		await flip_pony($Player, FlipDirection.Right, true)
		player_direction = FlipDirection.Right
	player_is_flipping = false

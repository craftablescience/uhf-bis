extends Control


const PLAYER_MOVE_SPEED := 150

const TWEEN_TIME := 0.33333 / 6


enum FlipDirection {
	Left,
	Right,
}


var player_is_walking := false
var player_is_flipping := false
var player_direction := FlipDirection.Right


func walk_pony(pony: Pony2D) -> void:
	var dir: float = sign(pony.scale.x)
	var orig_pos := pony.position
	var orig_rot := pony.rotation_degrees
	var tween := get_tree().create_tween().bind_node(self)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.pony_body = Globals.PonyBody.NORMAL
		pony.position += Vector2(20 * dir, 15)
		pony.rotation_degrees += dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(10 * dir, 5)
		pony.rotation_degrees += dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(2 * dir, 2)
		pony.rotation_degrees += dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.pony_body = Globals.PonyBody.WALKING
		pony.position += Vector2(-2 * dir, -2)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-10 * dir, -5)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-20 * dir, -15)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-20 * dir, 15)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-10 * dir, 5)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-2 * dir, 2)
		pony.rotation_degrees += -dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.pony_body = Globals.PonyBody.NORMAL
		pony.position += Vector2(2 * dir, -2)
		pony.rotation_degrees += dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(10 * dir, -5)
		pony.rotation_degrees += dir)
	tween.tween_interval(TWEEN_TIME)
	tween.tween_callback(func() -> void:
		pony.position += Vector2(-20 * dir, -15)
		pony.rotation_degrees += dir)
	tween.tween_callback(func() -> void:
		pony.pony_body = Globals.PonyBody.NORMAL
		pony.position = orig_pos
		pony.rotation_degrees = orig_rot)
	tween.play()
	await tween.finished


func flip_pony(pony: Pony2D, direction: FlipDirection, should_tween: bool) -> void:
	if not should_tween:
		match direction:
			FlipDirection.Left:
				pony.scale.x = abs(pony.scale.x)
			FlipDirection.Right:
				pony.scale.x = -abs(pony.scale.x)
		return
	
	var original_scale = abs(pony.scale.x)
	match direction:
		FlipDirection.Left:
			var tween := get_tree().create_tween().bind_node(self)
			for i in range(6):
				tween.tween_interval(TWEEN_TIME)
				tween.tween_callback(func() -> void:
					pony.scale.x += TWEEN_TIME * 6 * original_scale)
			tween.tween_callback(func() -> void:
				pony.scale.x = original_scale)
			tween.play()
			await tween.finished
		FlipDirection.Right:
			var tween := get_tree().create_tween().bind_node(self)
			for i in range(6):
				tween.tween_interval(TWEEN_TIME)
				tween.tween_callback(func() -> void:
					pony.scale.x -= TWEEN_TIME * 6 * original_scale)
			tween.tween_callback(func() -> void:
				pony.scale.x = -original_scale)
			tween.play()
			await tween.finished


func _process(delta: float) -> void:
	if player_is_flipping:
		return
	
	if player_is_walking:
		$PlayerCamera.global_position.x += PLAYER_MOVE_SPEED * delta * (-1 if player_direction == FlipDirection.Left else 1)
		return
	
	var left = Input.is_action_pressed("mv_left")
	var right = Input.is_action_pressed("mv_right")
	if (left and right) or (not left and not right):
		return
	
	if left and player_direction != FlipDirection.Left:
		player_is_flipping = true
		await flip_pony(%Player, FlipDirection.Left, true)
		player_direction = FlipDirection.Left
		player_is_flipping = false
	elif right and player_direction != FlipDirection.Right:
		player_is_flipping = true
		await flip_pony(%Player, FlipDirection.Right, true)
		player_direction = FlipDirection.Right
		player_is_flipping = false
	elif (left and %Player.global_position.x - PLAYER_MOVE_SPEED > $Bounds/Left.global_position.x) or \
		 (right and %Player.global_position.x + PLAYER_MOVE_SPEED < $Bounds/Right.global_position.x):
		player_is_walking = true
		await walk_pony(%Player)
		player_is_walking = false

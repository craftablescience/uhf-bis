extends Control


signal start_game()


func hide_popups() -> void:
	$Quit.hide()


func _on_play_button_pressed() -> void:
	hide_popups()
	start_game.emit()


func _on_credits_button_pressed() -> void:
	pass


func _on_quit_button_pressed() -> void:
	if OS.get_name() != "Web":
		get_tree().quit()
	else:
		$Quit.show()

extends Panel



func _on_Play_pressed():
	AudioManager.is_playing = true
	AudioManager._reset_time()
	Music.play();


func _on_Reset_pressed():
	AudioManager.is_playing = false
	AudioManager._reset_time()
	AudioManager.stop()

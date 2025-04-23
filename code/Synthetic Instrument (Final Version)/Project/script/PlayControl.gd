extends Panel

func _on_Play_pressed():
    AudioManager.is_playing = true
    AudioManager._reset_time()
    Music.play()

func _on_Reset_pressed():
    AudioManager.is_playing = false
    AudioManager._reset_time()
    AudioManager.stop()

func _on_NextSong_pressed():
    Music.next_song()
    var label = get_node("SongLabel")
    if label:
        label.text = Music.get_current_song()["title"]  #Full Disclaimer I don't know how to properly fit this into the UI (could be done via the Record holder)

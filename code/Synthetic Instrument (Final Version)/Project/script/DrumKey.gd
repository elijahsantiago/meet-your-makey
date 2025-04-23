extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
var key_value

var player
var is_pressed = false

var shrink_timer: Timer
var reset_timer: Timer  

var original_scale := Vector2.ONE  # This makes them dynamic from scene

func _ready():
    original_scale = rect_scale

    # Initialize timers
    shrink_timer = Timer.new()
    add_child(shrink_timer)
    shrink_timer.connect("timeout", self, "_on_shrink_timeout")
    
    reset_timer = Timer.new()
    add_child(reset_timer)
    reset_timer.connect("timeout", self, "_on_reset_timeout")

func _process(delta):
    if is_pressed:
        rect_scale = original_scale * 0.9  # Shrink based on original scale
        shrink_timer.start(0.05)
    else:
        rect_scale = original_scale  # Reset to original scale
        reset_timer.stop()
        shrink_timer.stop()

    # Play the audio
    if player != null and player.playing:
        player.pitch_scale = float(AudioManager.pitch)
        player.volume_db = -80 if AudioManager.volume == 0 else (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)

func _play_music():
    is_pressed = true
    
    player = AudioStreamPlayer.new()
    add_child(player)

    key_value = Key_Identifier.keys()[key]
    player.stream = AudioManager.drum_dictionary[key_value]
    player.volume_db = AudioManager.volume
    player.pitch_scale = AudioManager.pitch
    player.play()

    if AudioManager.is_recording:
        AudioManager.ref_scroll_item_container._spawn("Drum", key_value, AudioManager.elapsed_mili, .1)

func _stop_music():
    is_pressed = false
    rect_scale = original_scale  # Reset to original (NEEDED TO KEEP THEM LIKE LAYOUT)

func _on_shrink_timeout():
    rect_scale = original_scale * 0.9

func _on_reset_timeout():
    rect_scale = original_scale

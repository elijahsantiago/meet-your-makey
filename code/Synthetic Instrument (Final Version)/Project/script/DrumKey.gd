extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
var key_value

var player
var is_pressed = false
var timer_t = null

var shrink_timer: Timer
var reset_timer: Timer  

func _ready():
    # Initialize timers
    shrink_timer = Timer.new()
    self.add_child(shrink_timer)
    shrink_timer.connect("timeout", self, "_on_shrink_timeout")
    
    reset_timer = Timer.new()
    self.add_child(reset_timer)
    reset_timer.connect("timeout", self, "_on_reset_timeout")
    
    self.rect_scale = Vector2(1, 1)  # Ensure sprite starts with normal scale

func _process(delta):
    if is_pressed:
        # Shrink the sprite when pressed
        self.rect_scale = Vector2(0.9, 0.9)
        shrink_timer.start(0.05)
    else:
        self.rect_scale = Vector2(1, 1)
        reset_timer.stop()
        shrink_timer.stop()

    # Play the audio
    if player != null and player.playing == true:
        player.pitch_scale = float(AudioManager.pitch)
        if AudioManager.volume == 0:
            player.volume_db = -80
        else:
            player.volume_db = (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)

func _play_music():
    is_pressed = true
    
    player = AudioStreamPlayer.new()
    self.add_child(player)

    key_value = Key_Identifier.keys()[key]
    player.stream = AudioManager.drum_dictionary[key_value]
    player.volume_db = AudioManager.volume
    player.pitch_scale = AudioManager.pitch
    player.play()

    if AudioManager.is_recording == true:
        AudioManager.ref_scroll_item_container._spawn("Drum", key_value, AudioManager.elapsed_mili, .1)

func _stop_music():
    # Stop playing audio and reset the effect
    is_pressed = false
    self.rect_scale = Vector2(1, 1)  # Reset sprite scale to normal size

func _on_shrink_timeout():
    # Shrink the sprite temporarily
    self.rect_scale = Vector2(0.9, 0.9)  # Shrink sprite while pressed

func _on_reset_timeout():
    self.rect_scale = Vector2(1, 1)  # Reset to normal size after effect

extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
export(Texture) var normal_texture
export(Texture) var pressed_texture

var key_value
var player: AudioStreamPlayer
var is_pressed = false

func _ready():
    texture = normal_texture  # Set initial texture
    player = AudioStreamPlayer.new()
    add_child(player)  # Add player once, not every time a key is pressed

func _play_music():
    if player.playing:  
        return

    is_pressed = true
    texture = pressed_texture  

    key_value = Key_Identifier.keys()[key]
    player.stream = AudioManager.piano_dictionary[key_value]
    
    var adjusted_volume_db = (AudioManager.volume / 100.0) * 80 - 80  # Normalize to -80 to 0 dB
    player.volume_db = clamp(adjusted_volume_db, -10, 0) 

    player.pitch_scale = AudioManager.pitch
    player.play()

    if AudioManager.is_recording:
        AudioManager.ref_scroll_item_container._spawn("Piano", key_value, AudioManager.elapsed_mili, .1)

func _stop_music():
    is_pressed = false
    texture = normal_texture  # Revert to normal texture
    player.stop()

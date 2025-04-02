extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
var key_value

var player
var is_pressed = false

func _ready():
    # Initialize the player when the node is ready
    player = AudioStreamPlayer.new()
    self.add_child(player)

func _process(delta):
    # Check for key press and play sound
    if is_pressed:
        if not player.playing:  # If the note is not already playing, start it
            key_value = Key_Identifier.keys()[key]
            player.stream = AudioManager.violin_dictionary[key_value]    
            player.volume_db = calculate_volume() 
            player.pitch_scale = AudioManager.pitch  
            player.play()

    else:
        if player.playing:  
            player.stop()

func _play_music():
    # Start the note when the key is pressed
    is_pressed = true

func _stop_music():
    # Stop the note when the key is released
    is_pressed = false

func calculate_volume() -> float:
    var adjusted_volume_db = (AudioManager.volume / 100.0) * 80 - 80  # Normalize to -80 to 0 dB
    return clamp(adjusted_volume_db, -10, 0)  # Clamp to -10 dB to 0 dB range

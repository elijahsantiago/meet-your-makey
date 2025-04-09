extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
var key_value

var player
var is_pressed = false

# Jittering parameters
var jitter_strength = 5.0  # How hard it jitters
var jitter_frequency = 0.05  # How fast it jitters


var original_position: Vector2
export var vertical_offset: float = 205.0  # Manually adjust because something about vector2 breaks the positioning
export var horizontal_offset: float = 50.0  

# Initialize a random number generator - For random jittering
var rng = RandomNumberGenerator.new()

func _ready():
    player = AudioStreamPlayer.new()
    self.add_child(player)

    # Store the original position in world coordinates
    original_position = self.get_global_position()

    # Apply both offsets
    rect_position = original_position + Vector2(horizontal_offset, vertical_offset)

func _process(delta):
    # Check for key press and play sound
    if is_pressed:
        if not player.playing:  # This is for note smearing purposes (allows notes to be held and stopped accordingly)
            key_value = Key_Identifier.keys()[key]
            player.stream = AudioManager.violin_dictionary[key_value]    
            player.volume_db = calculate_volume() 
            player.pitch_scale = AudioManager.pitch  
            player.play()

        # Apply jitter effect
        if rng.randf() < jitter_frequency:
            var jitter_x = rng.randf_range(-jitter_strength, jitter_strength)
            var jitter_y = rng.randf_range(-jitter_strength, jitter_strength)

            rect_position = original_position + Vector2(jitter_x, jitter_y) + Vector2(horizontal_offset, vertical_offset)

    else:
        if player.playing:  
            player.stop()

        # Return to correct position when not jittering
        rect_position = original_position + Vector2(horizontal_offset, vertical_offset)

func _play_music():
    is_pressed = true

func _stop_music():
    is_pressed = false

func calculate_volume() -> float:
    var adjusted_volume_db = (AudioManager.volume / 100.0) * 80 - 80  # Normalize to -80 to 0 dB
    return clamp(adjusted_volume_db, -10, 0)  # Clamp to -10 dB to 0 dB range (PLEASE DO NOT REMOVE AUDIO SEEMS TO BE BROKEN AND THIS IS A BALANCER)

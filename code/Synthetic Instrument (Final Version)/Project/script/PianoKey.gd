extends TextureRect

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
export(Texture) var normal_texture
export(Texture) var pressed_texture
export(NodePath) var highlight_sprite_path  # Drag your sprite node into this from the editor

var key_value
var player: AudioStreamPlayer
var is_pressed = false
var highlight_sprite: Sprite  # Or Sprite2D depending on your node

func _ready():
    texture = normal_texture
    player = AudioStreamPlayer.new()
    add_child(player)

    # Get the highlight sprite from the path
    if highlight_sprite_path != null:
        highlight_sprite = get_node(highlight_sprite_path)

func _play_music():
    if player.playing:
        return

    is_pressed = true
    texture = pressed_texture

    if highlight_sprite:
        highlight_sprite.modulate = Color(1, 1, 1, 1)  # Full brightness (you can also use emission/shader here)

    key_value = Key_Identifier.keys()[key]
    player.stream = AudioManager.piano_dictionary[key_value]

    var adjusted_volume_db = (AudioManager.volume / 100.0) * 80 - 80
    player.volume_db = clamp(adjusted_volume_db, -10, 0)

    player.pitch_scale = AudioManager.pitch
    player.play()

    if AudioManager.is_recording:
        AudioManager.ref_scroll_item_container._spawn("Piano", key_value, AudioManager.elapsed_mili, 0.1)

func _stop_music():
    is_pressed = false
    texture = normal_texture
    player.stop()

    if highlight_sprite:
        highlight_sprite.modulate = Color(0.7, 0.7, 0.7, 1)  # Dim glow or neutral tone

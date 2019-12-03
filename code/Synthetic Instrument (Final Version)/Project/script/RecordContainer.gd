extends PanelContainer

export(NodePath) onready var ref_time_label = get_node(ref_time_label)
export(NodePath) onready var ref_rec_button = get_node(ref_rec_button)
export(NodePath) onready var ref_scroll_item = get_node(ref_scroll_item)

func _ready():
	ref_time_label.text = str("Time - ", AudioManager.str_elapsed)

func _process(delta):
	ref_time_label.text = str("Time - ", AudioManager.str_elapsed)


func _on_Record_toggled(button_pressed):
	if button_pressed == true:
		AudioManager._reset_time()
		AudioManager.is_playing = false
		AudioManager.stop()
	AudioManager.is_recording = button_pressed
	

func _on_Clear_pressed():
	ref_rec_button.pressed = false
	AudioManager.is_recording = false
	AudioManager._reset_time()
	AudioManager.is_playing = false
	AudioManager.stop()
	for item in ref_scroll_item.get_children():
		item.free()

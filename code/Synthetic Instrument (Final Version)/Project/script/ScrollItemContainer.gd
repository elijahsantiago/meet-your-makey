extends VBoxContainer

const record_info = preload("res://prefab/Record Info.tscn")

func _ready():
	AudioManager.ref_scroll_item_container = self

func _spawn(instrument, note, start_time, length):
	var info = record_info.instance()
	self.add_child(info)
	info._set_text(instrument, note, start_time, length)

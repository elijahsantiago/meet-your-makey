extends Node2D


func _on_pitch_slider_value_changed(value):
	self.rotation_degrees = (((value - 0) * (45 - (-45))) / (2-0)) + (-45)

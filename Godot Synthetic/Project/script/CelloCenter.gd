extends Node2D


func _process(delta):
	self.rotation_degrees = (((AudioManager.pitch - 0) * (60 - (-60))) / (2-0)) + (-60)

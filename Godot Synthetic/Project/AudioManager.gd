extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = AudioStreamPlayer.new();
	self.add_child(player)
	player.stream = load("res://Music/CelloA.wav")
	player.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

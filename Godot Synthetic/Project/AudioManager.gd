extends node


export(AudioStreamPlayer2D) var player;

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = AudioStreamPlayer.new();
	self.add_child(player)
	player.stream = load("res://Music/CelloA.wav")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

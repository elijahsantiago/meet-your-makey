extends Node2D

onready var audio_w = get_node("W Note");
onready var audio_a = get_node("A Note");
onready var audio_s = get_node("S Note");
onready var audio_d = get_node("D Note");
onready var audio_f = get_node("F Note");
onready var audio_g = get_node("G Note");

onready var key_w = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/W Key");
onready var key_a = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/A Key");
onready var key_s = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/S Key");
onready var key_d = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/D Key");
onready var key_f = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/F Key");
onready var key_g = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center/G Key");

onready var rotation_node = get_tree().get_root().get_node("Root Node/PanelContainer/Panel/Circle Background/Center");


var pitch = 1;

func _process(delta):
	audio_w.pitch_scale = pitch
	audio_a.pitch_scale = pitch
	audio_s.pitch_scale = pitch
	audio_d.pitch_scale = pitch
	audio_f.pitch_scale = pitch
	audio_g.pitch_scale = pitch

func _input(event):
	if event is InputEventKey:
		if event.is_pressed() == true and event.scancode == KEY_UP and not event.echo:
			if rotation_node.rotation_range < 60:
				rotation_node.rotation_range += 1;
				pitch += .02
			
		if event.is_pressed() == true and event.scancode == KEY_DOWN and not event.echo:
			if rotation_node.rotation_range > 0:
				rotation_node.rotation_range -= 1;
				pitch -= .02
		
		
		if event.is_pressed() == true and event.scancode == KEY_W and not event.echo:
			key_w.isPressed = true
			audio_w.play()
		elif event.is_pressed()  == false and event.scancode == KEY_W:
			key_w.isPressed = false
			audio_w.stop()
			
		if event.is_pressed() == true and event.scancode == KEY_A and not event.echo:
			key_a.isPressed = true
			audio_a.play()
		elif event.is_pressed()  == false and event.scancode == KEY_A:
			key_a.isPressed = false
			audio_a.stop()
			
		if event.is_pressed() == true and event.scancode == KEY_S and not event.echo:
			key_s.isPressed = true
			audio_s.play()
		elif event.is_pressed()  == false and event.scancode == KEY_S:
			key_s.isPressed = false
			audio_s.stop()
			
		if event.is_pressed() == true and event.scancode == KEY_D and not event.echo:
			key_d.isPressed = true
			audio_d.play()
		elif event.is_pressed()  == false and event.scancode == KEY_D:
			key_d.isPressed = false
			audio_d.stop()
			
		if event.is_pressed() == true and event.scancode == KEY_F and not event.echo:
			key_f.isPressed = true
			audio_f.play()
		elif event.is_pressed()  == false and event.scancode == KEY_F:
			key_f.isPressed = false
			audio_f.stop()
			
		if event.is_pressed() == true and event.scancode == KEY_G and not event.echo:
			key_g.isPressed = true
			audio_g.play()
		elif event.is_pressed()  == false and event.scancode == KEY_G:
			key_g.isPressed = false
			audio_g.stop()

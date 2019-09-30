extends Node2D

var center = self.position
var diameter = 250
var inner_radius = diameter/2
var outer_radius = (diameter/2) - 50
var inner_color = Color(37,37,42)

func _draw():
	draw_line(Vector2(0,0), Vector2(20,20), Color(0.37,0.37,0.42, 1), 1.0, false);
	#Draw Outer Circle
	#draw_circle(Vector2(0,0), outer_radius, Color(255,255,255))
	
	#Draw Inner Circle
	#draw_circle(Vector2(50,50), inner_radius, Color(37,37,42))
	
	

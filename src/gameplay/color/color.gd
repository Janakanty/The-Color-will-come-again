extends Node2D

var rand_color  
var mouse_entered = false
var actually_color 
var point_color = 1

func _physics_process(delta):
		if Global.color_end == true:
				queue_free()

func _ready():
		randf_color()

func _input(event):
		if Input.is_action_just_pressed("LMB") and mouse_entered == true:
				get_point()
			
func get_point():
	Global.point += point_color
	Global.point_to_sell += point_color
	point_color = 0
	get_node("/root/level_1/play_arena/arena/punkty").text = str(Global.point)
	get_node("/root/level_1/play_arena/arena/zebrane_kolory").text = str(Global.point_to_sell)
	queue_free() 	

func randf_color():
		rand_color = Color(randf(), randf(), randf())
		get_node("Sprite").modulate = rand_color
		
func _on_Area2D_area_entered(area):
		if area.is_in_group("player"):
				actually_color = area
				mouse_entered = true	
		if area.is_in_group("enemy"):
				queue_free()

func _on_Area2D_area_exited(area):
		if area.is_in_group("player"):
				mouse_entered = false






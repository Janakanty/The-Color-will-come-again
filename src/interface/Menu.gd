extends Control

onready var level1 = preload("res://src/gameplay/level_1.tscn")


func _on_Button_pressed():
	get_tree().change_scene_to(level1)


func _on_Button2_pressed():
	get_tree().quit()

extends Control

func _input(event):
		if Input.is_action_just_pressed("exit"):
				get_tree().quit()

func _ready():
	
		$Label.text = str(Global.point)
		if Global.hp <= 0:
				$ColorRect.visible = false
				$ColorRect2.visible = true
		else:
				$ColorRect.visible = true
				$ColorRect2.visible = false

func _on_Button_pressed():
	get_tree().change_scene("res://src/gameplay/level_1.tscn")

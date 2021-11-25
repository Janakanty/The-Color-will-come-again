extends Node2D

var vface_happy1 = preload("res://graphics/bad_character/face_happy.png")
var vface_happy2 = preload("res://graphics/bad_character/face_happy2.png")
var vface_angry = preload("res://graphics/bad_character/face_angry.png")
var vface_normal = preload("res://graphics/bad_character/face_normal.png")
var vface_hit1 = preload("res://graphics/bad_character/face_hit1.png")
var vface_hit2 = preload("res://graphics/bad_character/face_hit2.png")
var vface_hit3 = preload("res://graphics/bad_character/face_hit3.png")
var vface_hit4 = preload("res://graphics/bad_character/face_hit4.png")
var vface_death = preload("res://graphics/bad_character/face_death.png")

onready var TweenNode = get_node("Tween")
var color_kruh = preload("res://src/gameplay/color/color.tscn")
var player = preload("res://src/gameplay/player/player.tscn").instance()

var cutscene = false
var extreme = false

func _ready():
		Global.point = 0
		Global.point_to_sell = 0
		Global.hp = 100
		get_node("play_arena/arena/punkty").text = str(Global.point)
		get_node("play_arena/arena/zebrane_kolory").text = str(Global.point_to_sell)
		$ProgressBar.value = 100
		start()
		cutscene = true
		
func _input(event):
		if extreme == true:
				color_put5()
		skip_cutscene()
		if Input.is_action_just_pressed("exit"):
				get_tree().quit()

####################################################

func start():
		$start.play("start_game")
		$intro.play()

func _on_start_animation_finished(anim_name):
		$enemy.play("start")
		cutscene = false

func start_level1():
	$game.play("level1")
	$enemy.play("fly")
	$level1.play()
	
func start_weapon():
	$weapon.play("weapon")
	
func skip_cutscene():
	if Input.is_action_just_pressed("RMB"):
			if cutscene == true: 
					cutscene = false
					$intro.stop()
					$start.stop()
					$enemy.play("start")
#####################################################
func face_happy1():
		get_node("play_arena/enemy_face").texture = vface_happy1
		
func face_happy2():
		get_node("play_arena/enemy_face").texture = vface_happy2
		
func face_normal():
		get_node("play_arena/enemy_face").texture = vface_normal

func face_angry():
		get_node("play_arena/enemy_face").texture = vface_angry

#####################################################

func color_put1():
		var color_kruh_instance = color_kruh.instance()
		get_node("play_arena/colors").add_child(color_kruh_instance)
		color_kruh_instance.global_position.x = rand_range(20, 1900)
		color_kruh_instance.global_position.y = rand_range(300, 1000)
		
func color_put2():
		var color_kruh_instance = color_kruh.instance()
		get_node("play_arena/colors").add_child(color_kruh_instance)
		color_kruh_instance.global_position.x = rand_range(20, 1900)
		color_kruh_instance.global_position.y = rand_range(300, 1000)
		color_kruh_instance.scale = Vector2(0.5,0.5)

func color_put3():
		var color_kruh_instance = color_kruh.instance()
		get_node("play_arena/colors").add_child(color_kruh_instance)
		color_kruh_instance.global_position.x = rand_range(20, 1900)
		color_kruh_instance.global_position.y = rand_range(300, 1000)
		var rand_scale = rand_range(10,100) * 0.01
		color_kruh_instance.scale = Vector2(rand_scale,rand_scale)
		var rand_pos_x = rand_range(100, 1900)
		var rand_pos_y = rand_range(300, 1000)
		TweenNode.interpolate_property(color_kruh_instance, "position", global_position,Vector2(rand_pos_x, rand_pos_y), 2,Tween.TRANS_QUINT, Tween.EASE_OUT)
		TweenNode.start()
		
func color_put4():
		var color_kruh_instance = color_kruh.instance()
		get_node("play_arena/colors").add_child(color_kruh_instance)
		color_kruh_instance.global_position.x = rand_range(20, 1900)
		color_kruh_instance.global_position.y = rand_range(300, 1000)
		var rand_scale = rand_range(10,100) * 0.01
		color_kruh_instance.scale = Vector2(rand_scale,rand_scale)
		var rand_pos_x = rand_range(100, 1900)
		var rand_pos_y = rand_range(300, 1000)
		TweenNode.interpolate_property(color_kruh_instance, "position", color_kruh_instance.position,Vector2(rand_pos_x, rand_pos_y), 2,Tween.TRANS_QUINT, Tween.EASE_OUT)
		TweenNode.start()
		
func color_put5():
		var color_kruh_instance = color_kruh.instance()
		get_node("play_arena/colors").add_child(color_kruh_instance)
		color_kruh_instance.global_position.x = rand_range(20, 1900)
		color_kruh_instance.global_position.y = rand_range(300, 1000)
		color_kruh_instance.scale = Vector2(0.15,0.15)		

func color_off():
		Global.color_end = true
		$clean.play()
		
func color_on():
		Global.color_end = false

func extreme_color_on():
		extreme = true
		
func extreme_color_off():
		extreme = false
		

func _on_Button_pressed():
	if Global.point_to_sell >=10:
		get_node("ProgressBar").value -=2
		Global.hp -=2
		Global.point_to_sell -=10
		get_node("hit").play()
		if Global.hp <= 0 :
				get_tree().change_scene("res://src/interface/end.tscn")


func _on_game_animation_finished(anim_name):
		get_tree().change_scene("res://src/interface/end.tscn")

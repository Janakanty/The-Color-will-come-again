extends KinematicBody2D

var r = 255
var g = 255
var b = 0

func _ready():
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _physics_process(delta):
		setInterval()
		self.position = self.get_global_mouse_position()

func setInterval():
		if r > 0 and b == 0:
				r-=1
				g+=1
		if g > 0 and r == 0:
				g-=1
				b+=1
		if b > 0 and g == 0:
				r+=1
				b-=1
		
		modulate.r8 = r
		modulate.g8 = g
		modulate.b8 = b



extends CharacterBody2D

var speed = 150
var cont = 0
var num = 2
@onready var sprite = $lekshads
var movedir = Vector2(0, 0)
func _physics_process(delta):	
	controls_loop()
	movement_loop()

	
func controls_loop():	
	#Controles-----------------------------------------
	var left = Input.is_action_pressed("ui_left")
	var shift = Input.is_action_pressed("ui_shift")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var t = Input.is_action_pressed("ui_t")
	var anim = "idle"
	var anim_costas = "costas"
	var anim_frente = "frente"
	#Controles-----------------------------------------
	
	#mover----------------------------
	movedir.x = -int(left)+int(right)
	if movedir.x == 1:
		anim = "walk"
	movedir.y = -int(up)+int(down)
	if movedir.x == -1:
		anim = "walk"
	if shift: 
		movedir.x = -int(left)+int(right)+int(right)-int(left)
		movedir.y = -int(up)+int(down)+int(down)-int(up)
	if movedir.x == 2:
		anim = "correr"
	if movedir.x == -2:
		anim = "correr"
		
	if movedir.y == 2:
		anim_frente = "correr_frente"
	if movedir.y == -2:
		anim_costas = "correr_costas"
	#mover----------------------------
	
	if movedir.x == 2 or movedir.x == -2:
		speed = 550
	if movedir.x == 1 or movedir.x == -1:
		speed = 150
	if movedir.y == 2 or movedir.y == -2:
		speed = 550
	if movedir.y == 1 or movedir.y == -1:
		speed = 150
	
	#animção----------------------
	if movedir.y == 0:
		if left:
			sprite.play(anim)
			sprite.flip_h = true
	if movedir.y == 0:
		if right:
			sprite.play(anim)
			sprite.flip_h = false
	if up:
		sprite.play(anim_costas)
	if down:
		sprite.play(anim_frente)
	#animação-------------------
	
#movimentos de soco----------------------------
	if Input.is_action_just_pressed("mouse1"):
		cont = cont + num	
	if cont == 1:
		anim = "aa"
	if cont == 2:
		anim = "ab"
		if anim == "ab" and sprite.frame == 5:
			anim = "aa"
			cont = 1
			num = 2
	if cont == 3:
		anim = "ac"
		if anim == "ac" and sprite.frame == 13:
			anim = "aa"
			cont = 1
			num = 3
	if cont == 4:
		anim = "ad"
		if anim == "ad" and sprite.frame == 5:
			anim = "aa"
			cont = 1
			num = 4
	if cont == 5:
		anim = "ac"
		if anim == "ac" and sprite.frame == 13:
			anim = "aa"
			cont = 1
			num = 5
	if cont == 6:
		cont = cont * 0
		num = 2
	if cont > 6:
		cont = cont * 0
#----------------------------------------------
		
#tocar animação de idle se nao estiver se movendo-----------		
	if movedir.x == 0 and movedir.y == 0:
		sprite.play(anim)
#-----------------------------------------------------------	
func movement_loop():
	var motion = movedir.normalized() * speed
	set_velocity(motion)
	set_up_direction(Vector2(0, 0))
	move_and_slide()

extends CharacterBody2D

@export var speed = 6.00
@export var tileSize = 32.00
@onready var sprite = $sprite

var Iframes = 0
var initpos = Vector2()
var dir = Vector2()
var facing = "parado"
var counter = 0.00
var x = 0
var y = 0

var is_moving = false


func _ready():
	initpos = position
	
func _process(delta):
	
	if not is_moving:
		set_dir()
		
	elif dir != Vector2():
		move(delta)
	else:
		is_moving = false
		
	#if facing == "down":
	#	sprite.play("frente")
	#if facing == "up":
	#	sprite.play("costas")
	#if facing == "parado":
	#	sprite.play("idle")
	#if facing == "left":
	#	sprite.flip_h = true
	#	sprite.play("walk")
	#if facing == "right":
	#	sprite.flip_h = false
	#	sprite.play("walk")	
		
		
func set_dir():
	dir = get_dir()
	
	if dir.x != 0 or dir.y != 0:
		
		if dir.x > 0:
			facing = "right"
			sprite.flip_h = false
			sprite.play("walk")
		elif dir.x < 0:
			facing = "left"
			sprite.flip_h = true
			sprite.play("walk")
		elif dir.y > 0:
			facing = "down"
			sprite.play("frente")
		else:
			facing = "up"
			sprite.play("costas")
			
		is_moving = true
		initpos = position

func get_dir():
	var botao = "ui"
	#if dir.y == 0:
	x = float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left"))
		
	#if dir.x == 0:
	y = float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))

# declarei uma string que recebe o nome do botao que eu precionei
# a animaçao de idle só rodo direito com as animações de walk
# quando o botao nao precinado é o ultimo botao precionado
# pois o spcript apenas aceita um só if not Input
	
	if Input.is_action_pressed("ui_right"):
		botao = "ui_right"
	if Input.is_action_pressed("ui_up"):
		botao = "ui_up"
	if Input.is_action_pressed("ui_down"):
		botao = "ui_down"
	if Input.is_action_pressed("ui_left"):
		botao = "ui_left"
		
	if not Input.is_action_pressed(botao):
		sprite.play("idle")		
	return Vector2(x, y)
	
func move(delta):
	
	counter += delta * speed
	
	if counter >= 1.0:
		position = initpos + dir * tileSize
		counter = 0.0
		is_moving = false
	else:
		position = initpos + dir * tileSize * counter
		
func _physics_process(delta):	
	
	if is_on_wall():
		sprite.play("colisao")

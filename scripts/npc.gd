extends CharacterBody2D

const gravity = 10
const speed = 70
const floor_ = Vector2(0,-1)
var v = 0

var velocity = Vector2()

var direction = 1

func _ready():
	pass

func _physics_process(delta):
	velocity.x = speed * direction
	$icon/AnimationPlayer.play("andar")
	set_velocity(velocity)
	set_up_direction(floor_)
	move_and_slide()
	velocity = velocity

	if is_on_wall():
		direction = direction * -1

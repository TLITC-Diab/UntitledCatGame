extends KinematicBody2D

const FRICTION = 1250
const ACCELERATION = 400
const MAX_SPEED = 80

var velocity = Vector2.ZERO

onready var animationplayer = $AnimaitonPlayer
onready var animationtree = $AnimationTree

#movement
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	#set acceleration, max speed and friction
	if input_vector != Vector2.ZERO:
		animationtree.set("parameters/Idle/blend_position", input_vector)
		animationtree.set("parameters/Run/blend_position", input_vector)
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationplayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)


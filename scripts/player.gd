extends CharacterBody2D

const SPEED = 200.0

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D
var direction
var flipped = false

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("move_left"):
		direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("move_right"):
		direction = "right"
		play_animation(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("move_up"):
		direction = "up"
		play_animation(1)
		velocity.y = -SPEED
		velocity.x = 0
	elif Input.is_action_pressed("move_down"):
		direction = "down"
		play_animation(1)
		velocity.y = SPEED
		velocity.x = 0
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_animation(movement):
	if direction == "left":
		if movement == 1:
			animated.flip_h = true
			flipped = true
			animated.play("run")
		else:
			animated.play("ideal")
	else:
		if flipped:
			animated.flip_h = false
			flipped != flipped
		if movement == 1:
			animated.play("run")
		else:
			animated.play("ideal")

extends CharacterBody2D

signal hit

@export var speed = 200
var screen_size

var scale_h = 1
var is_jumping = false

var player_velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta): #this is a loop chat!!
	#gravity
	if not is_on_floor():
		player_velocity.y += 2
	else:
		player_velocity.y = 0

	#jumping 
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		player_velocity.y = -400
		$AnimatedSprite2D.animation = "jump"
		$AnimatedSprite2D.play()

	#movement
	if Input.is_action_pressed("move_right"):
		scale_h = 1
		player_velocity.x = speed
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.scale.x = scale_h
		$AnimatedSprite2D.play()
	elif Input.is_action_pressed("move_left"):
		scale_h = -1
		player_velocity.x = -speed
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.scale.x = scale_h
		$AnimatedSprite2D.play()
	else:
		player_velocity.x = 0
		$AnimatedSprite2D.animation = "stand still"
		$AnimatedSprite2D.scale.x = scale_h

	# Apply movement and handle collisions
	player_velocity = move_and_slide()

	# Clamp position to screen size
	position.x = clamp(position.x, 0, screen_size.x)

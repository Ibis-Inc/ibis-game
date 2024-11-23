extends Area2D

signal hit

@export var speed = 200
var screen_size

var scale_h = 1
var is_jumping = false

var isStanding = false

var velocity = Vector2();

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta): #this is a loop chat!!
	#gravity
	if isStanding:
		velocity.y = 0

	else:	
		velocity.y += 2

	#jumping 
	if Input.is_action_pressed("move_up"):
		velocity.y = 500

	#movement
	if Input.is_action_pressed("move_right"):
		scale_h = -1
		velocity.x = -25
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.scale.x = scale_h
		$AnimatedSprite2D.play()
		
	if Input.is_action_pressed("move_left"):
		scale_h = 1
		velocity.x = 25
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.scale.x = scale_h
		$AnimatedSprite2D.play()

	else:
		$AnimatedSprite2D.animation = "stand still"
		$AnimatedSprite2D.scale.x = scale_h
	# if Input.is_action_pressed("move_up"):
	# 	velocity.y = 1

	# if velocity.x != 0:
	# 	velocity = velocity.normalized() * speed
	# 	$AnimatedSprite2D.play()
	# else:
	# 	$AnimatedSprite2D.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)

	# if velocity.x < 0:
	# 	scale_h = -1
	
	# if velocity.x > 0:
	# 	scale_h = 1

	# if velocity.x != 0:
	# 	$AnimatedSprite2D.animation = "walk"
	# 	$AnimatedSprite2D.flip_v = false
	# 	$AnimatedSprite2D.scale.x = scale_h
	# if velocity.x == 0:
	# 	$AnimatedSprite2D.animation = "stand still"
	# if velocity.y != 0:
	# 	$AnimatedSprite2D.animation = "jump"
	# 	$AnimatedSprite2D.flip_v = false
	# 	$AnimatedSprite2D.flip_h = false


	# # Reset jumping state when not moving up
	# if not Input.is_action_pressed("move_up"):
	# 	is_jumping = false

func _on_body_entered(body: Node2D) -> void:
	print_debug("collided")
	isStanding = true

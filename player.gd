extends Area2D

@export var speed = 200
var screen_size

var scale_h

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)

	if velocity.x < 0:
		scale_h = -1
	
	if velocity.x > 0:
		scale_h = 1

	if velocity.x !=0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# $AnimatedSprite2D.scale.x = velocity.x
		$AnimatedSprite2D.scale.x = scale_h
	if velocity.x == 0:
		$AnimatedSprite2D.animation = "stand still"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = false
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "jump"

extends CharacterBody2D

@export var SPEED: float = 10000.0
const GRAVITY: float = 100.0
@onready var sprite := $Sprite2D
@onready var sprite_size: Vector2 = sprite.get_rect().size

func _physics_process(_delta):
	process_movement(_delta)

func process_movement(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED * delta
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED * delta
		if sprite.flip_h:
			sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED * delta
		if not sprite.flip_h:
			sprite.flip_h = true

	velocity.x = lerp(velocity.x, 0.0, 0.1)
	velocity.y = lerp(velocity.y, 0.0, 0.1)
	
	move_and_slide()

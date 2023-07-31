extends CharacterBody2D

@export var apfel_geist: CharacterBody2D
@export var x_follow_offset: float
@export var y_follow_offset: float

func _physics_process(delta):
	if apfel_geist != null:
		follow(apfel_geist)

func follow(character: CharacterBody2D):
	position.x = lerp(position.x, character.position.x - x_follow_offset, 0.05)
	position.y = lerp(position.y, character.position.y + y_follow_offset, 0.03)

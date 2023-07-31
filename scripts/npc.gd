extends CharacterBody2D

@export var apfel_geist: CharacterBody2D
@export var x_follow_offset: float
@export var y_follow_offset: float
@export var speed: float = 50

func _physics_process(delta):
	if apfel_geist != null:
		follow(apfel_geist)
	
# follows player using lerp and velocity
func follow(character: CharacterBody2D):
	if apfel_geist.get_child(0).flip_h:
		$Sprite2D.flip_h = true
		position.x = lerp(position.x, character.position.x + x_follow_offset + 25, 0.05)
		position.y = lerp(position.y, character.position.y + y_follow_offset, 0.03)
	else:
		$Sprite2D.flip_h = false
		position.x = lerp(position.x, character.position.x - x_follow_offset, 0.05)
		position.y = lerp(position.y, character.position.y + y_follow_offset, 0.03)

	# smooths the npc movement
	velocity.x = lerp(speed, 0.0, 0.7)
	velocity.x = lerp(position.y - character.position.y, 0.0, 0.4)
	
	move_and_slide()
	

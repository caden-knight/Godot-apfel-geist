extends Area2D

@onready var clues

func _process(_delta):
	pass

func give_clue():
	var suspect_clue = GameManager.suspects.pick_random()
	# TODO: remove the suspect clue from the array
	# make sure to do Game_Manager.suspects.erase(suspect_clue)
	
	var clue_string = "Hmmm. %s was with me"
	var clue = clue_string % suspect_clue
	
	print(clue)

func _on_body_entered(body):
	print(body.name + " body")
	if body.name == "apfel_geist":
		give_clue()

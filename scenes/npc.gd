extends Area2D

@onready var clues

var current_room: String = "Ballroom"
var clue_given: bool = false


func _process(_delta):
	pass

func give_clue():
	var suspect_clue = GameManager.suspects.pick_random()
	# TODO: remove the suspect clue from the array
	# make sure to do Game_Manager.suspects.erase(suspect_clue)
	
	var clue_string = "Hmmm. %s was with me"
	var clue = clue_string % suspect_clue
	clue_given = true
	
	print(clue)

func _on_body_entered(body):
	if body.name == "apfel_geist" && !clue_given:
		give_clue()

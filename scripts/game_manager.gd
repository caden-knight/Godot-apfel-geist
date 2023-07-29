extends Node2D

var suspects: Array[String] = ["Tyler", "Jax", "Caden", "Erin", "Gracie", "Stella"]
var locations: Array[String] = ["Kitchen", "Dining Room", "Billiard Room", "Study", "Conservatory", "Ballroom", "Hall", "Library"]
var weapons: Array[String] = ["Gun", "Knife", "Rope", "Wrench", "Candlestick", "Leadpipe"]

func _ready():
	game_setup()

func game_setup():
	var suspect: String = suspects.pick_random()
	var location: String = locations.pick_random()
	var weapon: String = weapons.pick_random()
	
	var solution_string = "It was %s with the %s in the %s"
	var solution = solution_string % [suspect, weapon, location]
	
	print(solution)

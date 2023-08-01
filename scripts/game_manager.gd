extends Node2D

var suspects: Array[String] = ["Tyler", "Jax", "Caden", "Erin", "Gracie", "Stella"]
var victims: Array[String] = suspects
var locations: Array[String] = ["Kitchen", "Dining Room", "Billiard Room", "Study", "Conservatory", "Ballroom", "Hall", "Library"]
var weapons: Array[String] = ["Gun", "Knife", "Rope", "Wrench", "Candlestick", "Lead pipe"]

func _ready():
	game_setup()

func game_setup():
	# pick random murder scenario
	var suspect: String = suspects.pick_random()
	victims.erase(suspect) # erase suspect from victim list so suspect can't also be victim
	var victim: String = victims.pick_random()
	var location: String = locations.pick_random()
	var weapon: String = weapons.pick_random()
	
	# remove the results from the arrays
	suspects.erase(suspect)
	locations.erase(location)
	weapons.erase(weapon)
	
	var solution_string = "%s was killed by %s with the %s in the %s"
	var solution = solution_string % [victim,suspect, weapon, location]
	
	print(solution)

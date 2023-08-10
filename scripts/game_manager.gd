extends Node2D

@export var suspects: Array[String] = ["Tyler", "Jax", "Caden", "Erin", "Gracie", "Stella", "Chris", "Dexter", "Max"]
enum Clue_Type {
	VICTIM,
	SUSPECT,
	WEAPON,
	LOCATION
}
var victims: Array[String] = suspects
var locations: Array[String] = ["Kitchen", "Dining Room", "Billiard Room", "Study", "Conservatory", "Ballroom", "Hall"]
var weapons: Array[String] = ["Gun", "Knife", "Rope", "Wrench", "Candlestick", "Lead pipe", "Apple slicer"]
var clues: Array[String] = []

func _ready():
	game_setup()
	give_first_clues()
 
func game_setup():
	# pick random murder scenario
	var suspect: String = suspects.pick_random()
	victims.erase(suspect) # erase suspect from victim list so suspect can't also be victim
	print(victims)
	var victim: String = victims.pick_random()
	suspects.erase(victim)
	print(suspects)
	var location: String = locations.pick_random()
	var weapon: String = weapons.pick_random()
	
	# remove the results from the arrays in order to use them as clues later on
	suspects.erase(suspect)
	victims.erase(victim)
	locations.erase(location)
	weapons.erase(weapon)
	
	var solution_string = "%s was killed by %s with the %s in the %s"
	var solution = solution_string % [victim, suspect, weapon, location]
	
	print(solution)

# gives clues to help player deduce the truth
func give_first_clues():
	pass

func choose_clue_type() -> Clue_Type:
	var clue_type: Clue_Type
	var possible_clues: Array[String] = ["v", "s", "w", "l"]
	var random_type = possible_clues.pick_random()
	
	match random_type:
		"v":
			clue_type = Clue_Type.VICTIM
		"s":
			clue_type = Clue_Type.SUSPECT
		"w":
			clue_type = Clue_Type.WEAPON
		"l":
			clue_type = Clue_Type.LOCATION
		_:
			clue_type = Clue_Type.VICTIM
		
	return clue_type


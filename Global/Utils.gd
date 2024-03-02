extends Node

const SAVE_PATH ="res://savegame.bin"

func saveGame():
	#creating a temporary file in the actual function
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"playerHappiness": Game.playerHappiness
	}
		
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			#takes all the lines in file and converts to a GODOT readable file and Godot wil load it in by accessing through dictionary
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP = current_line["playerHP"]
				Game.playerHappiness = current_line["playerHappiness"]
	if Game.playerHP ==0:
		Game.playerHP =10
		Game.playerHappiness = 0

extends Node

const SCORES_PATH = "user://tappy.dat"

var _score = 0
var _high_score = 0

func _ready() -> void:
	load_high_score() # load the saved highscore from the file on startup


func get_score():
	return _score


func get_high_score():
	return _high_score


func set_score(value: int): # set the high score to the score value if it is higher than the high score value.
	_score = value # it is setting the _score var to what is passed through the value var, if we ever called set score(5) or something.
	if _score > _high_score:
		_high_score = _score
	
	SignalManager.on_score_updated.emit(_score) # sending in the current _score as what is going to be emited. This is emiting the parameter


func increment_score():
	set_score(_score  + 1) # It is taking whatever the current _score is and adding 1 to it each time.


func load_high_score(): # load the high score from file
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ) # get the saved file and open it.
	if file:
		if file.get_length() > 0: # check to make sure there is a file and that it has stuff in it.
			_high_score = file.get_as_text().to_int() # gets the saved score that is saved as a string and turns it into an interger
			print("loaded highscore")
		else:
			print("Nothing in file")
		file.close()
	else:
		print("Failed to load file")


func save_high_score_to_file(): # save the highscore to file
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE) # get the saved file and write to it.
	if file:
		file.store_string(str(_high_score)) # storing the highscore value as a string so when you open the save file it's not 32 bit format.
		file.close()

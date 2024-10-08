extends Control

@onready var high_score_value: Label = $MarginContainer/HighScoreValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	high_score_value.text = str(ScoreManager.get_high_score()) # sets the highscore value to a string before setting the label to the score.  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"): 
		GameManager.load_game_scene() # if space is pressed when the main scene is loaded than it will run this function in the game manager scene, which loads the packed scene.

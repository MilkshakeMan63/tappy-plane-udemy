extends Control

@onready var score_label: Label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_updated.connect(update_score) # connects the emited signal to run the update score method below.


func update_score(score: int): # feeds the score parameter into this method that we get when the score is emited, as it emits the score value.
	score_label.text = str(score) # gets the score label and sets it's text to the current score value that is saved in the score manager scene.

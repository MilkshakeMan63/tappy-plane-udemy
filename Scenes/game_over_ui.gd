extends Control

@onready var game_over_timer: Timer = $GameOverTimer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound
@onready var press_space_label: Label = $PressSpaceLabel
@onready var game_over_label: Label = $GameOverLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.plane_died.connect(game_over)
	hide() # As soon as its ready this scene will be hidden on start.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if press_space_label.visible and Input.is_action_just_pressed("jump"): # if the space label and space button are pushed than load the menu.
		GameManager.load_menu() # load the menu scene from the game manager script


func game_over(): 
	game_over_timer.start() # Start the game over timer
	game_over_sound.play() # Play the game over sound
	show() # show this scene
	ScoreManager.save_high_score_to_file() # Save the highscore to file if it is greater than the saved highscore

func _on_game_over_timer_timeout() -> void:
	game_over_label.hide() # hide the game over label
	press_space_label.show() # show the press space label

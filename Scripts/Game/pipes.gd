extends Node2D

class_name Pipes

var speed = GameManager.SCROLL_SPEED # comes from autoload script. Type is GameManager and the constant in that script it SCROLL_SPEED. I am setting this var to that constant.

@onready var score_sound: AudioStreamPlayer = $ScoreSound
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _ready() -> void:
	SignalManager.plane_died.connect(on_plane_died) # connect signal from signal manager to out method below.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	check_off_screen()




func on_plane_died():
	set_process(false) # setting the process for the pipe to false


func _on_laser_body_entered(body: Node2D) -> void: # plays scored sound when a body enters the collision shape in the laser scene
	if body is Tappy: # if the body that is colliding is the class name Tappy then == true:
		score_sound.play()
		ScoreManager.increment_score() # adds 1 to the score everytime we pass a laser


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("Pipes Deleted")


func check_off_screen(): # fail safe to delete pipe if it goes off screen. The function above does work but may not if the window is minimized.
	if visible_on_screen_notifier_2d.position.x < get_viewport_rect().position.x: # checks if the pipe position is out of the viewport and deletes the scene if so.
		queue_free()


func _on_pipe_body_entered(body: Node2D) -> void: 
	if body is Tappy: # if the body that is colliding is the class name Tappy then == true:
		body.die() # run the function die() in the Tappy/plane script
	
	
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("die") == true:
			#body.die()

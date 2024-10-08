extends Node2D

const PIPES = preload("res://Scenes/Game/pipes.tscn")

@onready var spawn_up: Marker2D = $SpawnUp
@onready var spawn_low: Marker2D = $SpawnLow
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder
@onready var plane: Tappy = $Plane
@onready var game_over_ui: Control = $CanvasLayer/GameOverUI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_pipes()
	SignalManager.plane_died.connect(_on_plane_died) # connects the signal emited (plane_died) from signal manager to the function below (_on_plane_died).
	ScoreManager.set_score(0) # set the score to o and startup of the game.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:   
	pass	


func spawn_pipes():
	var new_pipes: Pipes = PIPES.instantiate() # creating a local var of the pipes scene. The pipes scene script has a class name of Pipes, which is the type. this creates a new pipe scene
	var random_y_pos: float = randf_range(spawn_up.position.y, spawn_low.position.y) # creating local var for random Y spawn position. It can be anything within the range for the two y position markers made in the game, which needs to be the position.y.
	new_pipes.position = Vector2(spawn_low.position.x, random_y_pos) # sets the position that we got from the random_y_pos code for are new pipe scene.
	pipes_holder.add_child(new_pipes) # adds the new pipe scene as a child of the pipes holder node in the game.


#func stop_pipes():
	#spawn_timer.stop()
	#for pipe in pipes_holder.get_children(): # using a loop with the loop var "pipe" to get an array of all instances in pipeholder node.
		#pipe.set_process(false) # with an array of all children set their process to false. stop moving.
# Got rid of the code above because it is now done in the pipes script using the signal from the signal manager.


func _on_spawn_timer_timeout() -> void:
	spawn_pipes()  # spawns pipes everytime the timer hits zero.
 

func _on_plane_died() -> void:
	#stop_pipes() # when the signal from the plane scene is emited this runs this method.
	spawn_timer.stop() # stops the timer so that more pipes don't keep spawing

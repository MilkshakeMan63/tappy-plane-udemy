extends CharacterBody2D

class_name Tappy

const GRAVITY = 1000
const JUMP_SPEED = -350

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta # creates the acceleration effect
	jump()
	move_and_slide()
	
	if is_on_floor() == true: # if we touch the floor the function die runs which stops the physics process from running 
		die()
	
	
func jump():
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
		animation_player.play("Jump")
	

func die():
	set_physics_process(false) # sets the physics process to false
	animated_sprite_2d.stop() # stops the aniamted sprite from playing
	audio_stream_player_2d.stop() 
	SignalManager.plane_died.emit() # emiting the signal from the signal manager "plane_died"

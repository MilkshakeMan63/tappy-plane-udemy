extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.plane_died.connect(stop_scrolling)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta # sets the scroll speed of the parallax background manually since the camera is stationary on this game.


func stop_scrolling(): 
	set_process(false) # stops the the scrolling when we die

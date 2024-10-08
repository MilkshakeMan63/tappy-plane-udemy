extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D
# @exort lets us change in the inspector window. This will allow us to set it in the parent scene with different values and textures for each instance.
@export var texture: Texture2D


func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height() # getting the scaling factor from the y height of the viewport
	sprite_2d.texture = texture # Setting the sprite to the texture we give it.
	sprite_2d.scale = Vector2(scale_f, scale_f) # setting the X and Y scale for the sprite_2d
	repeat_size.x = texture.get_width() * scale_f # sets the motion mirroring X value to the scale we set above
 

func _process(delta: float) -> void:
	pass

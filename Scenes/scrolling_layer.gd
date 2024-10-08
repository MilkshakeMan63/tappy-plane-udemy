extends ParallaxLayer

const IMAGE_WIDTH = 1920 
const IMAGE_HEIGHT = 1080

@onready var sprite_2d: Sprite2D = $Sprite2D

# @exort lets us change in the inspector window. This will allow us to set it in the parent scene with different values and textures for each instance.
@export var texture: Texture2D
@export var scroll_scale = 0.0


func _ready() -> void:
	motion_scale.x = scroll_scale # set the scroll speed to the scroll scale var
	var scale_f = get_viewport_rect().size.y / IMAGE_HEIGHT # getting the scaling factor from the y height of the viewport
	sprite_2d.texture = texture # Setting the sprite to the texture we give it.
	sprite_2d.scale = Vector2(scale_f, scale_f) # setting the X and Y scale for the sprite_2d
	motion_mirroring.x = IMAGE_WIDTH * scale_f # sets the motion mirroring X value to the scale we set above

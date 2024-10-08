extends Node

const GAME: PackedScene = preload("res://Scenes/Game/game.tscn")
const MAIN: PackedScene = preload("res://Scenes/UI & Other/main.tscn")

const SCROLL_SPEED = 120
const GROUP_PLANE = "Plane"


func load_game_scene():
	get_tree().change_scene_to_packed(GAME) # gets the packed scene and changes from this scene to the preloaded scene.

func load_menu():
	get_tree().change_scene_to_packed(MAIN) # gets the packed scene and changes from this scene to the preloaded scene.

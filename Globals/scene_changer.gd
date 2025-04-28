extends Node
class_name SceneChanger

var root:Window
var game = preload("res://Scenes/game_scene.tscn")
var menu = preload("res://Scenes/start_menu.tscn")


func _ready() -> void:
	root = get_parent()


func change_to(from,to):
	if to==null:
		return
	fade_in()
	root.remove_child(from)
	var newScene
	if to =="game":
		newScene=game.instantiate()
	elif to == "menu":
		newScene=menu.instantiate()
	root.add_child(newScene)
	fade_out()


func fade_in():
	pass
func fade_out():
	pass

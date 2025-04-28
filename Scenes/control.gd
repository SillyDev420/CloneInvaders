extends Control

@export var scoreLabel:Label
@export var WinScreen:Control
@export var main:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_handler.win.connect(win)
	score_handler.set_UI(self)
	score_handler.score=0
	update()
	
func update():
	scoreLabel.text = str(score_handler.score)


func _on_retry() -> void:
	scene_changer.change_to(main,"game")


func _on_menu() -> void:
	scene_changer.change_to(main,"menu")

func win():
	WinScreen.visible = true

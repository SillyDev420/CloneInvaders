extends Control
@export var MainLabel:Label
@export var MainSlider:HSlider
@export var Audio:PanelContainer

func _ready() -> void:
	MainLabel.text = str(MainSlider.value)


func _start_game() -> void:
	volume_handler.play_sound("ui")
	scene_changer.change_to(self,"game")

func _open_options() -> void:
	volume_handler.play_sound("ui")
	Audio.visible=true


func _quit_game() -> void:
	get_tree().quit()


func _main_change(value: float) -> void:
	volume_handler.play_sound("ui")
	MainLabel.text = str(value)
	volume_handler.vol_Main = value


func _exit() -> void:
	volume_handler.play_sound("ui")
	Audio.visible=false

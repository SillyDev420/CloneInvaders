extends Node


var score:int
var UI:Control

signal win

func set_UI(uinode):
	UI=uinode

func score_add(add:int):
	score +=add
	UI.update()
	if score ==68:
		win.emit()

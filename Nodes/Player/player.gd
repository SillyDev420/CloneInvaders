extends Node2D

@export var spawnpoint:Marker2D
var bullet_templ = preload("res://Nodes/Bullet/bullet.tscn")

var direction:int
var isWon:bool=false

func _ready() -> void:
	score_handler.win.connect(win)

func win():
	isWon=true
	direction=0

func _input(_event: InputEvent) -> void:
	if !isWon:
		if Input.is_action_just_pressed("shoot"):
			var bullet =bullet_templ.instantiate()
			spawnpoint.add_child(bullet)
			volume_handler.play_sound("shot")
			bullet.reparent(get_parent(),true)
			
		
		if Input.is_action_just_pressed("left"):
			direction=-1
		if Input.is_action_just_pressed("right"):
			direction= 1
		if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
			if !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
				direction=0


func _process(_delta: float) -> void:
	position.x += direction
	position.x = clamp(position.x,4,252)

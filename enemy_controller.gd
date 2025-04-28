extends Node2D

var enemy = preload("res://Nodes/Enemy/enemy.tscn")
var enemy_list:Array[Enemy]

var step:int
var move_dist:int = 4

func _ready() -> void:
	step=0
	call_deferred("spawn_enemies")

func spawn_enemies():
	for row in 4:
		for collumn in 17:
			var new_enemy:Area2D = enemy.instantiate()
			var new_pos:Vector2 = Vector2((1+collumn)*14,(1+row)*14)
			new_enemy.position = new_pos
			add_child(new_enemy)
			enemy_list.append(new_enemy)
	enemy_movement()


func enemy_movement():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	var left:bool=false
	var right:bool=true
	var count:int=0
	timer.start()
	while true:
		await timer.timeout
		if count ==3:
			count=0
			if right:
				right=false
				left=true
			else :
				right=true
				left=false
		if right:
			for enmy in enemy_list:
				enmy.move(move_dist)
		if left:
			for enmy in enemy_list:
				enmy.move(move_dist*-1)
		count +=1

func remove_from_list(enmy:Enemy):
	enemy_list.erase(enmy)

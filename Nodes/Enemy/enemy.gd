extends Area2D
class_name Enemy

@export var Sprite:AnimatedSprite2D
@export var Particles:CPUParticles2D

var isDying:bool = false

func move(by:int):
	position.x += by

func die():
	if isDying:
		return false
	isDying=true
	score_handler.score_add(1)
	#collision_layer
	if get_parent().has_method("remove_from_list"):
		get_parent().remove_from_list(self)
	
	Sprite.play("die")
	Particles.emitting = true
	volume_handler.play_sound("kill")
	await  Sprite.animation_finished
	await Particles.finished
	get_parent().remove_child(self)
	queue_free()

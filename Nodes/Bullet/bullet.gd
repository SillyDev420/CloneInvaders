extends Area2D
class_name Bullet

@export var speed:int

func _process(delta: float) -> void:
	self.position.y -=speed *delta

func die():
	queue_free()


#when enemy is touched
func _on_area_entered(area: Area2D) -> void:
	var enemy:Area2D=area
	if enemy.has_method("die"):
		if !enemy.isDying:
			enemy.die()
			call_deferred("die")

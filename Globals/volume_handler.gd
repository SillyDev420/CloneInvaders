extends Node
class_name Volume_Handler

var UISound:AudioStreamWAV = preload("res://Sounds/click.wav")
var KillSound:AudioStreamWAV= preload("res://Sounds/kill.wav")
var ShotSound:AudioStreamWAV= preload("res://Sounds/shot.wav")

var vol_Main:float
var vol_Music:float
var vol_SFX:float


func play_sound(sound:String):
	var new_Player:AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(new_Player)
	
	var db_vol = lerp(-30.0, 0.0, vol_Main / 100.0) # <- notice the .0
	new_Player.volume_db = db_vol
	print(db_vol)
	
	if sound=="ui":
		new_Player.stream = UISound
		new_Player.playing=true
	elif sound=="kill":
		new_Player.stream = KillSound
		new_Player.playing=true
	elif sound=="shot":
		new_Player.stream = ShotSound
		new_Player.playing=true
	
	
	await new_Player.finished
	new_Player.queue_free()

extends CharacterBody2D
class_name Player

@export var shoot:PackedScene
@onready var screensize = get_viewport_rect().size

var explosion:bool =false
const SPEED=80

func _process(_delta):
	if(explosion==false):
		anim_ctrl()
		motion_ctrl()
func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		shoot_ctrl()
	
func anim_ctrl() ->void:
	if GLOBAL.getAxis().y<0:
		$SpaceShip.animation="Down"
	elif GLOBAL.getAxis().y>0:
		$SpaceShip.animation="Up"
	else:
		$SpaceShip.animation="Idle"
		
func motion_ctrl() ->void:
	velocity.x=GLOBAL.getAxis().x*SPEED
	velocity.y=GLOBAL.getAxis().y*SPEED
	move_and_slide()
	position.x=clamp(position.x,0,screensize.x)
	position.y=clamp(position.y,0,screensize.y)
	
func shoot_ctrl() ->void:
	if(explosion==false):
		$Flash.play("Flash")
		$Settings/AudioShoot.play()
	
		var shoot_instance=shoot.instantiate()
		shoot_instance.global_position=$Settings/ShootSpawn.global_position
		get_tree().call_group("Level","add_child",shoot_instance)
func dead():
	if(explosion==false):
		explosion=true
		$SpaceShip.queue_free()
		$Settings.queue_free()
		$Flash.queue_free()
		$AudioExplosion.play()
		$Explosion.play("Explosion")
func quitar_vida():
	if(GLOBAL.vidas>0):
		GLOBAL.vidas-=1
		if(GLOBAL.vidas<=0):
			dead()
	


func _on_audio_explosion_finished() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

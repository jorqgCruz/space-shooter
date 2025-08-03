extends Node2D
class_name Enemy
const SPEED =50
@export var explosion:bool =false
func _process(_delta):
	if(explosion==false):
		motion_ctrl(_delta)
	
func motion_ctrl(delta):
	global_position.x-=SPEED*delta
	

func dead():
	explosion=true
	$Area.queue_free()
	$Explosion.play("Explosion")
	$Explosion/AudioListener2D.play()
	GLOBAL.score+=1
	
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("Shoot"):
		dead()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.

func _on_audio_listener_2d_finished() -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.quitar_vida()
	pass # Replace with function body.

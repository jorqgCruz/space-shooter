extends Area2D
class_name Shoot

const SPEED =292

func _process(_delta):
	anim_ctrl()
	motion_ctrl(_delta)
	

func anim_ctrl() ->void:
	$ShootAnimation.play("Shoot")
	
func motion_ctrl(delta):
	'global_position+=Vector2(1,0)*2'
	global_position.x+=SPEED*delta
	
	


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	
	queue_free()
	pass # Replace with function body.

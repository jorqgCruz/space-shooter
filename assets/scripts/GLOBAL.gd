extends Node


var score:int=0
var vidas:int=1




var axis: Vector2

func getAxis() -> Vector2:
	axis.x=int(Input.is_key_pressed(KEY_D))-int(Input.is_key_pressed(KEY_A))
	axis.y=int(Input.is_key_pressed(KEY_S))-int(Input.is_key_pressed(KEY_W))
	
	return axis.normalized()
	

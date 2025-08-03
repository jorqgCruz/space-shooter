extends Node2D

@export var enemy: PackedScene
@export var player: PackedScene
@export var int_puntos_para_ganar:int

func _ready() -> void:
	GLOBAL.score=0
	GLOBAL.vidas=3
	$Interfaz/MarginContainer/VBoxContainer/HBoxContainer/Puntos.text="Puntos: "+str(GLOBAL.score)
	$Interfaz/MarginContainer/VBoxContainer/HBoxContainer/Vida.text="Vidas: "+str(GLOBAL.vidas)
	var player_instance=player.instantiate()
	player_instance.global_position=$PositionPlayer.global_position
	add_child(player_instance)
	pass
func _process(delta) ->void:
	
	parallax_bg(delta)
	actualizar_puntos()
	actualizar_vida()
	
	'$Background/PathSpawn/PathFollow.set_process($Background/PathSpawn/PathFollow.set_process+80*delta)'
	$Background/PathSpawn/PathFollow.set_progress($Background/PathSpawn/PathFollow.get_progress()+80*delta)
func _on_timer_timeout() -> void:
	var enemy_instance=enemy.instantiate()
	enemy_instance.global_position=$Background/PathSpawn/PathFollow.global_position
	
	add_child(enemy_instance)
	
func parallax_bg(delta_time):
	
	get_node("Background/Back").scroll_base_offset-=Vector2(1,0)*8*delta_time
	$Background/Planet_1.scroll_base_offset-=Vector2(1,0)*15*delta_time
	$Background/Planet_2.scroll_base_offset-=Vector2(1,0)*15*delta_time
	
	'$Background/Back.scroll_base_offset-=Vector2(1,0)*8*delta_time Es lo mismo que la línea anterior'
	'$Background/Back_1.scroll_base_offset-=Vector2(1,0)*8*delta_time'
func actualizar_puntos() -> void:
	$Interfaz/MarginContainer/VBoxContainer/HBoxContainer/Puntos.text="Puntos: "+str(GLOBAL.score)
	if GLOBAL.score >= int_puntos_para_ganar:
		get_tree().change_scene_to_file("res://scenes/Victory.tscn")
	
	
func actualizar_vida() -> void:
	$Interfaz/MarginContainer/VBoxContainer/HBoxContainer/Vida.text="Vidas: "+str(GLOBAL.vidas)

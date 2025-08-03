extends Node



func _on_timer_timeout() -> void:
	$ScrollContainer.scroll_vertical+=1

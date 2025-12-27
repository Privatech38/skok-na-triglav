extends AnimationPlayer

@onready var player = get_node("../../../Player")
	
func _player_enter(node: Node2D) -> void:
	if node != player:
		return
	play("platform_move")
	
func _player_leave(node: Node2D) -> void:
	if node != player:
		return
	play_backwards("platform_move")

extends AnimationPlayer

@onready var player = get_node("../../../Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _player_enter(node: Node2D) -> void:
	if node != player:
		return
	play("platform_move")
	
func _player_leave(node: Node2D) -> void:
	if node != player:
		return
	play_backwards("platform_move")

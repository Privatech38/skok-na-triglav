extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
var facing_right = true

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if velocity.x != 0:
		facing_right = velocity.x > 0
	
	if facing_right:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	if is_on_floor():
		if velocity.x == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump_up")
		else:
			sprite.play("fall")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if is_on_floor():
		var direction := Input.get_axis("move_left", "move_right")
		velocity.x = direction * SPEED

	move_and_slide()

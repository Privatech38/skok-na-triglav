extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY_BASE = -200.0
const JUMP_VELOCITY_ADD = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
var facing_right = true

var time_held_start = 0
var time_held = 0

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

	if Input.is_action_just_released("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY_BASE + clamp(time_held, 0, 1000) / 1000.0 * JUMP_VELOCITY_ADD
		velocity.x = SPEED if facing_right else -SPEED
		return

	if is_on_floor():
		var direction := Input.get_axis("move_left", "move_right")
		velocity.x = direction * SPEED



	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		time_held_start = Time.get_ticks_msec()
	elif event.is_action_released("jump"):
		time_held = Time.get_ticks_msec() - time_held_start
		print("Jump held for %s ms" % time_held)
		

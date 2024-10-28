extends CharacterBody2D

signal death

@export var SPEED = 300.0
@export var ACCELERATION = 0.25
@export var MAX_HEALTH = 100

var health = MAX_HEALTH

func begin():
	health = MAX_HEALTH


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		# velocity = direction * SPEED
		velocity = lerp(velocity, direction * SPEED, ACCELERATION)
	else:
		# velocity.x = move_toward(velocity.x, 0, SPEED)
		# velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity = lerp(velocity, Vector2.ZERO, ACCELERATION)

	move_and_slide()
	

func damage(amt: int):
	health -= amt

func heal(amt: int):
	health += amt

func resolve_health():
	if (health <= 0):
		health = 0
		die()
	if (health > MAX_HEALTH):
		health = MAX_HEALTH

func die():
	print("player dead oh no")
	death.emit()

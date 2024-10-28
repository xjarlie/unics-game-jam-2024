extends CharacterBody2D

@export var health = 50

const SPEED = 400
var direction = Vector2(1, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()
	pass
	
func on_hit_by_player(damage):
	health -= damage

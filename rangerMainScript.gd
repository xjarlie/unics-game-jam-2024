extends CharacterBody2D

@export var health = 50

const SPEED = 100
var direction
var distance

var hitbox
var aimPoint
var player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	aimPoint = self.get_node("AimPoint")
	hitbox = self.get_node("RangerHitbox")
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	distance = (player.position - global_position).length()
	direction = -(Vector2.RIGHT.rotated(aimPoint.rotation))
	if distance < 300: # <--------------------------------------------------- Distance at which it stops retreating.
		velocity = direction * SPEED
	else:
		velocity = Vector2(0, 0)
	move_and_slide()
	
func on_hit_by_player(damage):
	health -= damage

func _on_shoot_timer_timeout() -> void:
	aimPoint.shootProjectile()

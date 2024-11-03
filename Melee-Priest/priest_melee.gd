extends CharacterBody2D

var player

@export var health = 100
@export var turning = true

const SPEED = 100.0
var direction
var angle = 0

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	direction = (player.position - position).normalized()
	velocity = direction * SPEED
	
	if turning:
		move_and_slide()
		rotate_attack(player.position)
	
func _process(delta: float) -> void:
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("spear-stab")
		on_hit_by_player(5)

func on_hit_by_player(damage):
	$damage.text = str(damage)
	$damage/AnimationPlayer.play("damage-number")
	
	var dam_dir = randf_range(0, 2*PI)
	var dam_len = randf_range(0, 75)
	$damage.position = $damage.position.length() * Vector2.RIGHT.rotated(dam_dir)
	
	
	
	health -= damage
	
	if health <= 0:
		queue_free()

func rotate_attack(player_pos):
	$Area2D.look_at(player_pos)

func _on_area_2d_body_entered(body: Node2D) -> void:
	player.damage(50)
	player.resolve_health()

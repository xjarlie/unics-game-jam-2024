extends CharacterBody2D

var player

@export var health = 100

const SPEED = 300.0
var direction = Vector2(1, 0)
var angle = 0

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	#move_and_slide()
	rotate_attack(player.position)
	
func _process(delta: float) -> void:
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("spear-stab")

func on_hit_by_player(damage):
	health -= damage
	
	if health <= 0:
		queue_free()

func rotate_attack(player_pos):
	$Area2D.look_at(player_pos)


func _on_area_2d_body_entered(body: Node2D) -> void:
	player.damage(50)
	player.resolve_health()

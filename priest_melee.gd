extends CharacterBody2D

@export var health = 100

const SPEED = 300.0
var direction = Vector2(1, 0)
var angle = 0

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()

func on_hit_by_player(damage):
	health -= damage
	
	if health <= 0:
		queue_free()

func rotate_attack(player):
	$Area2D.look_at(player)


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass #do damage to player

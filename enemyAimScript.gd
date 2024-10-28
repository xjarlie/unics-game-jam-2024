extends Node2D

var player

var projectile = preload("res://projectile.tscn")
var projectileSpeed = 400
var projectileDirection

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.position)
	pass

func shootProjectile():
	var projectileInst = projectile.instantiate()
	get_tree().current_scene.add_child(projectileInst)
	projectileInst.position = global_position
	projectileDirection = Vector2.RIGHT.rotated(rotation)
	projectileInst.velocity = projectileDirection * projectileSpeed
	

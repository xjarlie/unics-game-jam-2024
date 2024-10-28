extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	beginGame();

func beginGame() -> void:
	print("hello world");
	$Player.begin()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_death() -> void:
	print("main: oh no player dead")

extends CanvasLayer

signal pause
signal unpause
signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PauseMenu.hide()
	$DeathMenu.hide()

func update_health(health: int):
	$HealthBar.value = health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		handle_pause()

func handle_pause():
	print("pause")
	get_tree().paused = true
	$PauseMenu.show()
	pause.emit()
	
func handle_unpause():
	print("unpause")
	get_tree().paused = false
	$PauseMenu.hide()
	unpause.emit()

func _on_pause_button_pressed() -> void:
	handle_pause()

func on_player_death():
	get_tree().paused = true
	$DeathMenu.show()

func _on_resume_button_pressed() -> void:
	print("nymmm")
	handle_unpause()

func _on_restart_button_pressed() -> void:
	print("Restart?")
	get_tree().paused = false
	restart.emit()
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://StartMenu.tscn")

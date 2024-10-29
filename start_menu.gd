extends Node2D

var fileToLoad = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/ProgressBar.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (fileToLoad != ""):
		var progress = []
		ResourceLoader.load_threaded_get_status(fileToLoad, progress)
		$CanvasLayer/ProgressBar.value = progress[0] * 100
		if (progress[0] == 1):
			get_tree().change_scene_to_file(fileToLoad)



func _on_start_button_pressed():
	$CanvasLayer/StartButton.hide()
	$CanvasLayer/ProgressBar.show()
	fileToLoad = "res://main.tscn"
	ResourceLoader.load_threaded_request(fileToLoad)

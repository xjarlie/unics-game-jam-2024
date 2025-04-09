extends CanvasLayer

var current_text_num = 0
var text

func _ready() -> void:
	signal_bus.connect("display_dialogue", show_dialogue)
	signal_bus.connect("game_over", pause)
	signal_bus.connect("pause", pause)
	signal_bus.connect("unpause", unpause)
	
	signal_bus.display_dialogue.emit(["hello", "part2"])

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		next_dialogue()
	
func show_dialogue(new_text):
	text = new_text
	$Label.text = text[current_text_num] #should always be 0 in this line
	show()
	
func next_dialogue():
	if text and current_text_num < len(text) - 1:
		current_text_num += 1
		$Label.text = text[current_text_num]
	else:
		current_text_num = 0
		text = null
		hide()

func pause():
	hide()

func unpause():
	if text:
		show()

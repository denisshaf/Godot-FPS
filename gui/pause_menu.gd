extends ColorRect


@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit


func _ready():
	visible = false
	play_button.pressed.connect(unpause)
	quit_button.pressed.connect(get_tree().quit)


func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false


func pause():
	visible = true
	animator.play("Pause")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

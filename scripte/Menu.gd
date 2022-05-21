 extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start_Button.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Start_Button_pressed_():
	get_tree().change_scene("res://scene/scene.tscn")

func _on_HowToPLay_Button_pressed_():
	get_tree().change_scene("res://scene/scene.tscn")

func _on_Options_Button_pressed_():
	var options = load("res://scene/player.tscn").instance()
	get_tree().current_scene.add_child(options)

func _on_Quit_Button_pressed_():
	get_tree().quit()

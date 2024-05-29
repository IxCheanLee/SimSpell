extends Node2D

func _ready():
	get_node("Label/LetterBlink").play("BlackLetter")
	$Lowgow.play("default")
	Global.getUserData()

#//............................................................................
#On action events
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://PlayerMenuScene.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
#On action events
#//............................................................................

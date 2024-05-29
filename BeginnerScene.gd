extends Node2D

var wordToSpell 
var inventori = []

# Called when the node enters the scene tree for the first time.
func _ready():

	#Sets current equipped background
	Global.layerName = "BeginnerScene"
	Global.nodePath = $Background
	Global.equipBG()
	#Sets current equipped background

	# Randomizes word to spell
	var random = randi()%6+1
	wordToSpell = (Global.lvlOneWord[random-1]["DaWord"].to_upper())
	%WordToSpell.text = (wordToSpell)
	
	var player = $AudioStreamPlayer

	if (wordToSpell.to_upper() == "FLY"):
		player.stream = Global.FlyMp3
		player.play()
	elif (wordToSpell.to_upper() == "LOG"):
		player.stream = Global.LogMp3
		player.play()
	elif (wordToSpell.to_upper() == "MAT"):
		player.stream = Global.MatMp3
		player.play()
	elif (wordToSpell.to_upper() == "ABO"):
		player.stream = Global.AboMp3
		player.play()
	elif (wordToSpell.to_upper() == "APA"):
		player.stream = Global.ApaMp3
		player.play()
	elif (wordToSpell.to_upper() == "USA"):
		player.stream = Global.UsaMp3
		player.play()

#//............................................................................
#On action events
func _on_quit_current_pressed():
	get_tree().change_scene_to_file("res://PlayerMenuScene.tscn")

func _on_verify_button_pressed():
	if ((%UserInput.text).to_upper() == wordToSpell.to_upper()):
		Global.addEXPnCoinz(5, 5)
		get_node("VerifyButton/CorrectLayer/CorrectAnim").play("transIn")
		
	else:
		get_node("VerifyButton/WrongLayer/WrongAnim").play("transIn")
		$UserInput.text = ""
		
	Global.getUserData()
#On action events
#//............................................................................

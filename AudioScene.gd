extends Node2D

var UserData = []
var inventori = []
var arawaraw = []
var playalvl
var wordToSpell

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Sets current equipped background
	Global.layerName = "AudioScene"
	Global.nodePath = $Background
	Global.equipBG()
	#Sets current equipped background
	
	getData()
	getDaily()
	if (playalvl == 1):
		var random = randi()%6+1
		wordToSpell = (Global.lvlOneWord[random-1]["DaWord"].to_upper())

	elif (playalvl == 2):
		var random = randi()%6+1
		wordToSpell = (Global.lvlTwoWord[random-1]["DaWord"].to_upper())

	elif (playalvl == 3):
		var random = randi()%6+1
		wordToSpell = (Global.lvlThreeWord[random-1]["DaWord"].to_upper())
	else:
		var random = randi()%18+1
		wordToSpell = (Global.allWerds[random-1]["DaWord"].to_upper())


#//............................................................................
#On action events
func _on_quit_current_pressed():
	get_tree().change_scene_to_file("res://PlayerMenuScene.tscn")
	Global.getUserData()

func _on_sound_prompt_pressed():
	var player = $SoundPrompt/AudioStreamPlayer

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
	
	elif (wordToSpell.to_upper() == "BAKAL"):
		player.stream = Global.BakalMp3
		player.play()
	elif (wordToSpell.to_upper() == "ELESI"):
		player.stream = Global.ElesiMp3
		player.play()
	elif (wordToSpell.to_upper() == "LUNAS"):
		player.stream = Global.LunasMp3
		player.play()
	elif (wordToSpell.to_upper() == "GRASP"):
		player.stream = Global.GraspMp3
		player.play()
	elif (wordToSpell.to_upper() == "QUART"):
		player.stream = Global.QuartMp3
		player.play()
	elif (wordToSpell.to_upper() == "RURAL"):
		player.stream = Global.RuralMp3
		player.play()
	
	elif (wordToSpell.to_upper() == "WATAWAT"):
		player.stream = Global.WatawatMp3
		player.play()
	elif (wordToSpell.to_upper() == "PANGAKO"):
		player.stream = Global.PangakoMp3
		player.play()
	elif (wordToSpell.to_upper() == "BAKURAN"):
		player.stream = Global.BakuranMp3
		player.play()
	elif (wordToSpell.to_upper() == "BULWARK"):
		player.stream = Global.BulwarkMp3
		player.play()
	elif (wordToSpell.to_upper() == "HEDONIC"):
		player.stream = Global.HedonicMp3
		player.play()
	elif (wordToSpell.to_upper() == "GRIMACE"):
		player.stream = Global.GrimaceMp3
		player.play()
	Global.getUserData()

func _on_verify_button_pressed():
	if ((%UserInput.text).to_upper() == wordToSpell.to_upper()):
		Daily()
		if(playalvl == 1):
			Global.addEXPnCoinz(10, 10)
		elif(playalvl == 2):
			Global.addEXPnCoinz(20, 20)
		elif(playalvl == 3):
			Global.addEXPnCoinz(25, 30)
		else:
			Global.addEXPnCoinz(35, 35)
		get_node("VerifyButton/CorrectLayer/CorrectAnim").play("transIn")

	else:
		get_node("VerifyButton/WrongLayer/WrongAnim").play("transIn")
		$UserInput.text = ""
	Global.getUserData()
#On action events
#//............................................................................


func getData():
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		playalvl = UserData[0]["DifficultyVal"]


#//............................................................................
#Daily task
func getDaily():
		Global.Db.open_db()
		var table = "Daily"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			arawaraw.append(Global.Db.query_result[i])
		Global.Db.close_db()

func Daily():
	if(Time.get_date_string_from_system(false) != arawaraw[0]["Date"] && arawaraw[0]["Status"] == 0):
		Global.Db.open_db()
		var table = "Daily"
		Global.Db.query("Update "+ table +" Set Status = 1 Where DailyID = 1;")
		Global.Db.close_db()
#Daily task
#//............................................................................


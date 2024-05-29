extends Node2D

var UserData = []
var inventori = []
var arawaraw = []
var playalvl
var wordToSpell

#Sets some letters to blank spaces
func blank_letters(b):
	var a = []
	for i in range(wordToSpell.length()):
		if i == 1 || i == 3 || i == 5:
			a.append("_")
		else:
			a.append(wordToSpell[i])
	return "".join(a)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Sets current equipped background
	Global.layerName = "BlankScene"
	Global.nodePath = $Background
	Global.equipBG()
	#Sets current equipped background
	
	getData()
	getDaily()
	if (playalvl == 1):
		var random = randi()%6+1
		wordToSpell = (Global.lvlOneWord[random-1]["DaWord"].to_upper())
		$BlankLetters.text = blank_letters(wordToSpell)

	elif (playalvl == 2):
		var random = randi()%6+1
		wordToSpell = (Global.lvlTwoWord[random-1]["DaWord"].to_upper())
		$BlankLetters.text = blank_letters(wordToSpell)

	elif (playalvl == 3):
		var random = randi()%6+1
		wordToSpell = (Global.lvlThreeWord[random-1]["DaWord"].to_upper())
		$BlankLetters.text = blank_letters(wordToSpell)

	else:
		var random = randi()%18+1
		wordToSpell = (Global.allWerds[random-1]["DaWord"].to_upper())
		$BlankLetters.text = blank_letters(wordToSpell)


#//............................................................................
#On action events
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

func _on_quit_current_pressed():
	get_tree().change_scene_to_file("res://PlayerMenuScene.tscn")
	Global.getUserData()

func getData():
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		playalvl = UserData[0]["DifficultyVal"]
#On action events
#//............................................................................


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

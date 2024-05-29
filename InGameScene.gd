extends Node2D

var UserData = []
var inventori = []
var arawaraw = []
var playalvl
var wordToSpell

func _ready():
	
	#Sets current equipped background
	Global.layerName = "InGameScene"
	Global.nodePath = $Background
	Global.equipBG()
	#Sets current equipped background
	
	getData()
	getDaily()
	if (playalvl == 1):
		var random = randi()%6+1
		wordToSpell = (Global.lvlOneWord[random-1]["DaWord"].to_upper())
		if (wordToSpell.to_upper() == "FLY"):
			$TextureRect.texture = load("res://Assets/SuperheroFly.png") 
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "LOG"):
			$TextureRect.texture = load("res://Assets/woodLog.png")
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "MAT"):
			$TextureRect.texture = load("res://Assets/rolledMat.png")
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "ABO"):
			$TextureRect.texture = load("res://Assets/AboAsh.png")
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "APA"):
			$TextureRect.texture = load("res://Assets/apaApa.png")
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "USA"):
			$TextureRect.texture = load("res://Assets/usaDeer.png")
			$DefinitionLabel.text = Global.lvlOneDef[random-1]["Definition"]
	elif (playalvl == 2):
		var random = randi()%6+1
		wordToSpell = (Global.lvlTwoWord[random-1]["DaWord"].to_upper())
		if (wordToSpell.to_upper() == "BAKAL"):
			$TextureRect.texture = load("res://Assets/BakalPeroSilver.png") 
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "ELESI"):
			$TextureRect.texture = load("res://Assets/elesiYeah.png")
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "LUNAS"):
			$TextureRect.texture = load("res://Assets/luNas.png")
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "GRASP"):
			$TextureRect.texture = load("res://Assets/grasP.png")
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "QUART"):
			$TextureRect.texture = load("res://Assets/quartA.png")
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "RURAL"):
			$TextureRect.texture = load("res://Assets/rural.png")
			$DefinitionLabel.text = Global.lvlTwoDef[random-1]["Definition"]
		
	elif (playalvl == 3):
		var random = randi()%6+1
		wordToSpell = (Global.lvlThreeWord[random-1]["DaWord"].to_upper())
		if (wordToSpell.to_upper() == "WATAWAT"):
			$TextureRect.texture = load("res://Assets/Philippines-Waved-Flag-icon.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"] 
		elif (wordToSpell.to_upper() == "PANGAKO"):
			$TextureRect.texture = load("res://Assets/pangako.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "BAKURAN"):
			$TextureRect.texture = load("res://Assets/bakuran.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "BULWARK"):
			$TextureRect.texture = load("res://Assets/bulwark.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "HEDONIC"):
			$TextureRect.texture = load("res://Assets/hedonic.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "GRIMACE"):
			$TextureRect.texture = load("res://Assets/grimace.png")
			$DefinitionLabel.text = Global.lvlThreeDef[random-1]["Definition"]
	else:
		var random = randi()%18+1
		wordToSpell = (Global.allWerds[random-1]["DaWord"].to_upper())
		if (wordToSpell.to_upper() == "FLY"):
			$TextureRect.texture = load("res://Assets/SuperheroFly.png") 
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "LOG"):
			$TextureRect.texture = load("res://Assets/woodLog.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "MAT"):
			$TextureRect.texture = load("res://Assets/rolledMat.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "ABO"):
			$TextureRect.texture = load("res://Assets/AboAsh.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "APA"):
			$TextureRect.texture = load("res://Assets/apaApa.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "USA"):
			$TextureRect.texture = load("res://Assets/usaDeer.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "BAKAL"):
			$TextureRect.texture = load("res://Assets/BakalPeroSilver.png") 
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "ELESI"):
			$TextureRect.texture = load("res://Assets/elesiYeah.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "LUNAS"):
			$TextureRect.texture = load("res://Assets/luNas.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "GRASP"):
			$TextureRect.texture = load("res://Assets/grasP.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "QUART"):
			$TextureRect.texture = load("res://Assets/quartA.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "RURAL"):
			$TextureRect.texture = load("res://Assets/rural.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "WATAWAT"):
			$TextureRect.texture = load("res://Assets/Philippines-Waved-Flag-icon.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"] 
		elif (wordToSpell.to_upper() == "PANGAKO"):
			$TextureRect.texture = load("res://Assets/pangako.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "BAKURAN"):
			$TextureRect.texture = load("res://Assets/bakuran.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "BULWARK"):
			$TextureRect.texture = load("res://Assets/bulwark.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "HEDONIC"):
			$TextureRect.texture = load("res://Assets/hedonic.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]
		elif (wordToSpell.to_upper() == "GRIMACE"):
			$TextureRect.texture = load("res://Assets/grimace.png")
			$DefinitionLabel.text = Global.allDef[random-1]["Definition"]


#//............................................................................
#On action events
func _on_quit_current_pressed():
	get_tree().change_scene_to_file("res://PlayerMenuScene.tscn")
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

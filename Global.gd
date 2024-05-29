extends Node

const SqLite = preload("res://addons/godot-sqlite/gdsqlite.gdextension")
var Db
var Db_pangalan = "res://GameDataaa/gameDataBase.db" #"user://gameDataBase.db"
var UserData = []
var lvlOneWord = []
var lvlTwoWord = []
var lvlThreeWord = []
var lvlOneDef = []
var lvlTwoDef = []
var lvlThreeDef = []
var allWerds = []
var allDef = []
var playerlv
var Moneyz
var EXP
var volume1 = 0
var volume2 = 0
var itemStatus
var itemName
var itemCat
var rows
var currentBG
var queryResult
var layerName
var nodePath

var AboMp3 = preload("res://AudioAssets/Abo.mp3")
var ApaMp3 = preload("res://AudioAssets/apa.mp3")
var BakalMp3 = preload("res://AudioAssets/bakal.mp3")
var BakuranMp3 = preload("res://AudioAssets/Bakuran.mp3")
var BulwarkMp3 = preload("res://AudioAssets/Bulwark.mp3")
var ElesiMp3 = preload("res://AudioAssets/elesi.mp3")
var LunasMp3 = preload("res://AudioAssets/Lunas.mp3")
var FlyMp3 = preload("res://AudioAssets/fly.mp3")
var GraspMp3 = preload("res://AudioAssets/grasp.mp3")
var GrimaceMp3 = preload("res://AudioAssets/Grimace.mp3")
var HedonicMp3 = preload("res://AudioAssets/Hedonic.mp3")
var LogMp3 = preload("res://AudioAssets/log.mp3")
var MatMp3 = preload("res://AudioAssets/mat.mp3")
var PangakoMp3 = preload("res://AudioAssets/Pangako.mp3")
var QuartMp3 = preload("res://AudioAssets/quart.mp3")
var RuralMp3 = preload("res://AudioAssets/rural.mp3")
var UsaMp3 = preload("res://AudioAssets/usa.mp3")
var WatawatMp3 = preload("res://AudioAssets/Watawat.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	#DBparser()
	Db = SQLite.new()
	Db.path = Db_pangalan
	getUserData()
	getWords()

func getUserData():
	UserData = []
	Db.open_db()
	var table = "PlayerData"
	Db.query("Select * from "+ table+";")
	for i in range(0, Db.query_result.size()):
		UserData.append(Db.query_result[i])
	Db.close_db()
	playerlv = UserData[0]["DifficultyVal"]
	Moneyz = UserData[0]["CurrencyAmt"]
	EXP = UserData[0]["EXPpts"]

func addEXPnCoinz(x: int, y: int):
	Db.open_db()
	var table = 'PlayerData'
	Db.query("Update "+table+" Set EXPpts = EXPpts + "+str(x)+" Where pID = 1;")
	Db.query("Update "+table+" Set CurrencyAmt = CurrencyAmt + "+str(y)+" Where pID = 1;")
	Db.close_db()

func getWords():
	Db.open_db()
	var table = 'Words'
	Db.query("Select DaWord From "+table+" Where DifficultyID = 1;")
	for i in range(0, Db.query_result.size()):
			lvlOneWord.append(Db.query_result[i])
			
	Db.query("Select Definition From "+table+" Where DifficultyID = 1;")
	for j in range(0, Db.query_result.size()):
			lvlOneDef.append(Db.query_result[j])
			
	Db.query("Select DaWord From "+table+" Where DifficultyID = 2;")
	for i in range(0, Db.query_result.size()):
			lvlTwoWord.append(Db.query_result[i])
			
	Db.query("Select Definition From "+table+" Where DifficultyID = 2;")
	for j in range(0, Db.query_result.size()):
			lvlTwoDef.append(Db.query_result[j])
			
	Db.query("Select DaWord From "+table+" Where DifficultyID = 3;")
	for i in range(0, Db.query_result.size()):
			lvlThreeWord.append(Db.query_result[i])
			
	Db.query("Select Definition From "+table+" Where DifficultyID = 3;")
	for j in range(0, Db.query_result.size()):
			lvlThreeDef.append(Db.query_result[j])
	Db.query("Select DaWord From "+table+";")
	for i in range(0, Db.query_result.size()):
			allWerds.append(Db.query_result[i])
			
	Db.query("Select Definition From "+table+";")
	for j in range(0, Db.query_result.size()):
			allDef.append(Db.query_result[j])
	Db.close_db()

func lvlUP():
	Db.open_db()
	var table = "PlayerData"
	Db.query("Update "+ table +" Set EXPpts = 0 Where pID = 1;")
	Db.query("Update "+ table + " Set DifficultyVal = DifficultyVal + 1 Where pID = 1;")
	Db.close_db()

func reset():
	Db.open_db()
	var table = "PlayerData"
	Db.query("Update "+ table +" Set EXPpts = 0 Where pID = 1;")
	Db.query("Update "+ table + " Set DifficultyVal = 0 Where pID = 1;")
	Db.close_db()
	getUserData()
	
#func lvlUpper():
#	getUserData()
#	print(str(EXP)+"Global")
#	if EXP == 100:
#		print("AAAAAAAAAAAA")
#		lvlUP()
	
func DBparser():
	const dbPathRes = "res://GameDataaa/gameDataBase.db"
	const dbPath = "user://gameDataBase.db"
	var dir = DirAccess.open("user://")
	if (!FileAccess.file_exists(dbPath)):
		dir.copy(dbPathRes, dbPath)
	
func equipBG():
	Global.Db.open_db()
	Global.Db.query("SELECT ItemName FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Background';")
	rows = Global.Db.query_result
	if (rows.size() > 0):
		queryResult = Global.Db.query_result[0]
		itemName = queryResult["ItemName"]
		currentBG = "res://Assets/"+itemName+".png"
		nodePath.texture = load(currentBG)
	else:
		nodePath.texture = load("res://Assets/defaultBG.png")
	Global.Db.close_db() 
	

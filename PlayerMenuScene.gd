extends Node2D
var UserData = []
var inventori = []
var expointz
var playalvl
var currentCharacter
var currentHat
var currentShirt
var queryResult
var InvItemID
var itemStatus
var itemName
var itemCat
var rows

func _ready():
	
	#Sets current equipped background
	Global.layerName = "PlayerMenuScene"
	Global.nodePath = $Background
	Global.equipBG()
	#Sets current equipped background

	currentCharacter = "defaultAvatar"
	rows = []
	equipCharacter()
	equipHat()
	equipShirt()
	getData()
	setEXP()
	$Label.text = str(playalvl)


#//............................................................................
#On action events
func _on_shop_button_pressed():
	get_tree().paused = true
	get_node("ShopButton/ShopLayer/ShopAnim").play("transIn")

func _on_inventory_button_pressed():
	get_tree().paused = true
	get_node("InventoryButton/InventLayer/InventAnim").play("transIn")

func _on_settings_button_pressed():
	get_tree().paused = true
	get_node("SettingsButton/MenuLayer/MenuAnim").play("transIn")

func _on_btn_start_spelling_pressed():
		var random = randi()%4+1
	
		if (playalvl == 0):
			get_tree().change_scene_to_file("res://BeginnerScene.tscn")
		
		else:
			if (random == 1):
				get_tree().change_scene_to_file("res://InGameScene.tscn")
		
			elif (random == 2):
				get_tree().change_scene_to_file("res://ScrambledScene.tscn")
		
			elif (random == 3):
				get_tree().change_scene_to_file("res://AudioScene.tscn")
			
			elif (random == 4):
				get_tree().change_scene_to_file("res://BlankScene.tscn")

func _on_quest_button_pressed():
	get_tree().paused = true
	get_node("QuestButton/QuestLayer/QuestAnim").play("transIn")

#On action events
#//............................................................................


#//............................................................................
#Main screen functionalities
func getData():
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		expointz = UserData[0]["EXPpts"]
		playalvl = UserData[0]["DifficultyVal"]

func setEXP():
	$PlayerExpBar.value = expointz

func equipCharacter():
	Global.Db.open_db()
	Global.Db.query("SELECT ItemName FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Character';")
	rows = Global.Db.query_result
	if (rows.size() > 0):
		queryResult = Global.Db.query_result[0]
		itemName = queryResult["ItemName"]
		currentCharacter = itemName
		$Avatar.play(currentCharacter)
	else:
		$Avatar.play('defaultAvatar')
	Global.Db.close_db()

func equipHat():
	Global.Db.open_db()
	Global.Db.query("SELECT ItemName FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Hat';")
	rows = Global.Db.query_result
	if (rows.size() > 0):
		queryResult = Global.Db.query_result[0]
		itemName = queryResult["ItemName"]
		currentHat = "res://Assets/"+itemName+".png"
		print(currentHat)
		$HatSkin.texture = load(currentHat)
	else:
		$HatSkin.texture = load("res://Assets/blank.png")
	Global.Db.close_db()

func equipShirt():
	Global.Db.open_db()
	Global.Db.query("SELECT ItemName FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Shirt';")
	rows = Global.Db.query_result
	if (rows.size() > 0):
		queryResult = Global.Db.query_result[0]
		itemName = queryResult["ItemName"]
		currentShirt = "res://Assets/"+itemName+".png"
		$ShirtSkin.texture = load(currentShirt)
	else:
		$ShirtSkin.texture = load("res://Assets/blank.png")
	Global.Db.close_db()

func unpause():
	getData()
	setEXP()
	$Avatar.play("default")

#Main screen functionalities
#//............................................................................

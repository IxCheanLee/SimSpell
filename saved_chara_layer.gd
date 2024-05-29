extends CanvasLayer

var InvItemID
var ItemCat
var textureName
var buttonName
var lblName
var NameChara
var queryResult = []
var Hat = []
var Shirt = []
var Back = []
var itemStatus
var equipStatus

# Called when the node enters the scene tree for the first time.
func _ready():
	Cat()
	Bull()
	Tiger()
	Panda()
	Axolotl()
	BeardedDragon()

func _on_close_saved_pressed():
	get_node("SVAnim").play("transOut")

func _process(_delta):
	$TabContainer/SavedCharacters/RichTextLabel/ControlNod.position.x = -$TabContainer/SavedCharacters/HScrollBar.value

func Cat(): #Cat character
	InvItemID = 911
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Cat/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Cat/EquipItm1
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Cat/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func Bull(): #Bull character
	InvItemID = 1
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Bull/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Bull/EquipItm2
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Bull/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func Tiger(): #Tiger character
	InvItemID = 5
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Tiger/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Tiger/EquipItm3
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Tiger/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func Panda(): #Panda character
	InvItemID = 6
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Panda/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Panda/EquipItm4
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Panda/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func Axolotl(): #Axolotl character
	InvItemID = 13
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Axolotl/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Axolotl/EquipItm5
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/Axolotl/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func BeardedDragon(): #BeardedDragon character
	InvItemID = 14
	ItemCat = "Character"
	textureName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/BeardedDragon/Sprite2D
	buttonName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/BeardedDragon/EquipItm6
	lblName = $TabContainer/SavedCharacters/RichTextLabel/ControlNod/BeardedDragon/Label
	Status()
	getSavedName()
	lblName.text = NameChara
	itemVisibility()

func Status(): #Status getter, checks availability
	Global.Db.open_db()
	Global.Db.query("SELECT SavedStatus FROM SavedCharas WHERE CharacterID = "+str(InvItemID)+";")
	queryResult = Global.Db.query_result[0]
	itemStatus = queryResult["SavedStatus"]
	Global.Db.close_db()
	
func itemVisibility(): #item visibility setter, if item is visible in the inventory
	if (itemStatus == 2):
		textureName.visible = true
		buttonName.visible = true
		lblName.visible = true
	else:
		textureName.visible = false
		buttonName.visible = false
		lblName.visible = false

func getSavedName():
	Global.Db.open_db()
	Global.Db.query("SELECT CharaName FROM SavedCharas WHERE CharacterID = "+str(InvItemID)+";")
	queryResult = Global.Db.query_result[0]
	NameChara = queryResult["CharaName"]
	Global.Db.close_db()

func _on_equip_itm_1_pressed():
	InvItemID = 911
	Unequiper()
	EquipSaved()


func _on_equip_itm_2_pressed():
	InvItemID = 1
	Unequiper()
	EquipSaved()


func _on_equip_itm_3_pressed():
	InvItemID = 5
	Unequiper()
	EquipSaved()


func _on_equip_itm_4_pressed():
	InvItemID = 6
	Unequiper()
	EquipSaved()


func _on_equip_itm_5_pressed():
	InvItemID = 13
	Unequiper()
	EquipSaved()


func _on_equip_itm_6_pressed():
	InvItemID = 14
	Unequiper()
	EquipSaved()

func Unequiper():
	Global.Db.open_db()
	Global.Db.query("UPDATE Inventory SET EquipStatus = 1;")
	Global.Db.close_db()

func EquipSaved():
	Global.Db.open_db()
	Global.Db.query("SELECT AccessoryID FROM SavedCharas WHERE CharacterID = "+str(InvItemID)+";")
	for i in range(0, Global.Db.query_result.size()):
		Hat.append(Global.Db.query_result[i])
	Global.Db.query("SELECT ShirtID FROM SavedCharas WHERE CharacterID = "+str(InvItemID)+";")
	for i in range(0, Global.Db.query_result.size()):
		Shirt.append(Global.Db.query_result[i])
	Global.Db.query("SELECT BgID FROM SavedCharas WHERE CharacterID = "+str(InvItemID)+";")
	for i in range(0, Global.Db.query_result.size()):
		Back.append(Global.Db.query_result[i])
	
	Global.Db.query("UPDATE Inventory SET EquipStatus = 2 WHERE ItemID = "+str(Hat[0]["AccessoryID"])+";")
	Global.Db.query("UPDATE Inventory SET EquipStatus = 2 WHERE ItemID = "+str(Shirt[0]["ShirtID"])+";")
	if(InvItemID != 911):
		Global.Db.query("UPDATE Inventory SET EquipStatus = 2 WHERE ItemID = "+str(InvItemID)+";")
	if(Back[0]["BgID"] != 0):
		Global.Db.query("UPDATE Inventory SET EquipStatus = 2 WHERE ItemID = "+str(Back[0]["BgID"])+";")
	Global.Db.close_db()
	$EquipSound.play()

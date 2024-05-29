extends CanvasLayer

#//............................................................................
#variables
var inventori = []
var shopItemStatus = []
var charz = []
var hat = []
var shirt = []
var back = []
var queryResult
var itemStatus
var equipStatus
var InvItemID
var ItemCat
var textureName
var buttonName
var unButtonName
var lblName
var rows
var default = {"ItemID":0}
#variables
#//............................................................................

func _ready():
	#//
	#item call
	updootButone()
	#item call
	#//
	
#//............................................................................
#item status and availability
func itm1(): #Bull character
	InvItemID = 1
	ItemCat = "Character"
	textureName = $TabContainer/Characters/RichTextLabel/ControlNod/Item1/Sprite2D
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/Item1/EquipItm1
	lblName = $TabContainer/Characters/RichTextLabel/ControlNod/Item1/Label
	Status()
	itemVisibility()

func itm2(): #Cowboy hat accessory
	InvItemID = 2
	ItemCat = "Hat"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item2/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item2/EquipItm2
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item2/Label
	Status()
	itemVisibility()

func itm3(): #Barnyard fit accessory
	InvItemID = 3
	ItemCat = "Shirt"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item3/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item3/EquipItm3
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item3/Label
	Status()
	itemVisibility()

func itm4(): #Woods background
	InvItemID = 4
	ItemCat = "Background"
	textureName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item4/Sprite2D
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item4/EquipItm4
	lblName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item4/Label
	Status()
	itemVisibility()

func itm5(): #Tiger character
	InvItemID = 5
	ItemCat = "Character"
	textureName = $TabContainer/Characters/RichTextLabel/ControlNod/Item5/Sprite2D
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/Item5/EquipItm5
	lblName = $TabContainer/Characters/RichTextLabel/ControlNod/Item5/Label
	Status()
	itemVisibility()

func itm6(): #Panda character
	InvItemID = 6
	ItemCat = "Character"
	textureName = $TabContainer/Characters/RichTextLabel/ControlNod/Item6/Sprite2D
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/Item6/EquipItm6
	lblName = $TabContainer/Characters/RichTextLabel/ControlNod/Item6/Label
	Status()
	itemVisibility()

func itm7(): #Oriental Hairclip
	InvItemID = 7
	ItemCat = "Hat"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item7/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item7/EquipItm7
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item7/Label
	Status()
	itemVisibility()

func itm8(): #Oriental Dress
	InvItemID = 8
	ItemCat = "Shirt"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item8/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item8/EquipItm8
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item8/Label
	Status()
	itemVisibility()

func itm9(): #Bamboo Forest
	InvItemID = 9
	ItemCat = "Background"
	textureName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item9/Sprite2D
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item9/EquipItm9
	lblName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item9/Label
	Status()
	itemVisibility()

func itm10(): #Space Beret
	InvItemID = 10
	ItemCat = "Hat"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item10/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item10/EquipItm10
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item10/Label
	Status()
	itemVisibility()
	
func itm11(): #Space Blouse
	InvItemID = 11
	ItemCat = "Shirt"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item11/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item11/EquipItm11
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item11/Label
	Status()
	itemVisibility()

func itm12(): #Moon Station
	InvItemID = 12
	ItemCat = "Background"
	textureName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item12/Sprite2D
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item12/EquipItm12
	lblName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item12/Label
	Status()
	itemVisibility()

func itm13(): #Axolotl
	InvItemID = 13
	ItemCat = "Character"
	textureName = $TabContainer/Characters/RichTextLabel/ControlNod/Item13/Sprite2D
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/Item13/EquipItm13
	lblName = $TabContainer/Characters/RichTextLabel/ControlNod/Item13/Label
	Status()
	itemVisibility()

func itm14(): #Bearded Dragon
	InvItemID = 14
	ItemCat = "Character"
	textureName = $TabContainer/Characters/RichTextLabel/ControlNod/Item14/Sprite2D
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/Item14/EquipItm14
	lblName = $TabContainer/Characters/RichTextLabel/ControlNod/Item14/Label
	Status()
	itemVisibility()

func itm15(): #Beach Side
	InvItemID = 15
	ItemCat = "Background"
	textureName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item15/Sprite2D
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item15/EquipItm15
	lblName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item15/Label
	Status()
	itemVisibility()

func itm16(): #Red Carpet
	InvItemID = 16
	ItemCat = "Background"
	textureName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item16/Sprite2D
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item16/EquipItm16
	lblName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/Item16/Label
	Status()
	itemVisibility()

func itm17(): #Snorkel
	InvItemID = 17
	ItemCat = "Hat"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item17/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item17/EquipItm17
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item17/Label
	Status()
	itemVisibility()

func itm18(): #Life Vest
	InvItemID = 18
	ItemCat = "Shirt"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item18/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item18/EquipItm18
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item18/Label
	Status()
	itemVisibility()

func itm19(): #Fedora
	InvItemID = 19
	ItemCat = "Hat"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item19/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item19/EquipItm19
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item19/Label
	Status()
	itemVisibility()

func itm20(): #Tuxedo
	InvItemID = 20
	ItemCat = "Shirt"
	textureName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item20/Sprite2D
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item20/EquipItm20
	lblName = $TabContainer/Accessories/RichTextLabel/ControlNod/Item20/Label
	Status()
	itemVisibility()

#item status and availability
#//............................................................................

#//............................................................................
#Inventory functionalities
func Status(): #Status getter, checks availability
	Global.Db.open_db()
	Global.Db.query("SELECT AvailStatus FROM Inventory WHERE ItemID = "+str(InvItemID)+";")
	queryResult = Global.Db.query_result[0]
	itemStatus = queryResult["AvailStatus"]
	Global.Db.close_db()

func Equipped(): #sets equip status and calls equip and unequip functions
	Global.Db.open_db()
	Global.Db.query("SELECT EquipStatus FROM Inventory WHERE ItemID = "+str(InvItemID)+";")
	queryResult = Global.Db.query_result[0]
	equipStatus = queryResult["EquipStatus"]
	if (equipStatus == 1):
		itemEquip()
	elif (equipStatus == 2):
		itemUnequip()
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
	
	# 1 = item is unequipped, 2 = item is equipped
	Global.Db.open_db()
	Global.Db.query("SELECT EquipStatus FROM Inventory WHERE ItemID = "+str(InvItemID)+";")
	queryResult = Global.Db.query_result[0]
	equipStatus = queryResult["EquipStatus"]
	if (equipStatus == 2):
		buttonName.text = "Unequip"
	elif (equipStatus == 1):
		buttonName.text = "Equip"
	Global.Db.close_db()

func itemEquip(): #sets equipped status to true: 1 is unavailable for equipping, 2 is available
	Global.Db.open_db()
	Global.Db.query('UPDATE Inventory SET EquipStatus = 1 WHERE ItemCat IN (SELECT ItemCat FROM (SELECT ItemCat FROM Inventory WHERE AvailStatus = 2) AS "ItemCat" WHERE ItemCat = '+ItemCat+');') #reset every item with same category, makes sure equips one at a time
	Global.Db.query("UPDATE Inventory SET EquipStatus = 2 WHERE ItemID = "+str(InvItemID)+";") #make item unavailable for equipping
	Global.Db.close_db()
	$EquipSound.play()

func itemUnequip(): #sets equipped status to false
	Global.Db.open_db()
	Global.Db.query("UPDATE Inventory SET EquipStatus = 1 WHERE ItemID = "+str(InvItemID)+";")
	Global.Db.close_db()

#Inventory functionalities
#//............................................................................


#//............................................................................
#On action events

func _on_close_invent_pressed():
	get_node("InventAnim").play("transOut")

func _on_equip_itm_1_pressed():
	InvItemID = 1
	ItemCat = "'Character'"
	Equipped()
	updootButone()

func _on_equip_itm_2_pressed():
	InvItemID = 2
	ItemCat = "'Hat'"
	Equipped()
	updootButone()

func _on_equip_itm_3_pressed():
	InvItemID = 3
	ItemCat = "'Shirt'"
	Equipped()
	updootButone()

func _on_equip_itm_4_pressed():
	InvItemID = 4
	ItemCat = "'Background'"
	Equipped()
	updootButone()

func _on_equip_itm_5_pressed():
	InvItemID = 5
	ItemCat = "'Character'"
	Equipped()
	updootButone()

func _on_equip_itm_6_pressed():
	InvItemID = 6
	ItemCat = "'Character'"
	Equipped()
	updootButone()

func _on_equip_itm_7_pressed():
	InvItemID = 7
	ItemCat = "'Hat'"
	Equipped()
	updootButone()

func _on_equip_itm_8_pressed():
	InvItemID = 8
	ItemCat = "'Shirt'"
	Equipped()
	updootButone()

func _on_equip_itm_9_pressed():
	InvItemID = 9
	ItemCat = "'Background'"
	Equipped()
	updootButone()

func _on_equip_itm_10_pressed():
	InvItemID = 10
	ItemCat = "'Hat'"
	Equipped()
	updootButone()

func _on_equip_itm_11_pressed():
	InvItemID = 11
	ItemCat = "'Shirt'"
	Equipped()
	updootButone()

func _on_equip_itm_12_pressed():
	InvItemID = 12
	ItemCat = "'Background'"
	Equipped()
	updootButone()

func _on_equip_itm_13_pressed():
	InvItemID = 13
	ItemCat = "'Character'"
	Equipped()
	updootButone()

func _on_equip_itm_14_pressed():
	InvItemID = 14
	ItemCat = "'Character'"
	Equipped()
	updootButone()

func _on_equip_itm_15_pressed():
	InvItemID = 15
	ItemCat = "'Background'"
	Equipped()
	updootButone()

func _on_equip_itm_16_pressed():
	InvItemID = 16
	ItemCat = "'Background'"
	Equipped()
	updootButone()

func _on_equip_itm_17_pressed():
	InvItemID = 17
	ItemCat = "'Hat'"
	Equipped()
	updootButone()

func _on_equip_itm_18_pressed():
	InvItemID = 18
	ItemCat = "'Shirt'"
	Equipped()
	updootButone()

func _on_equip_itm_19_pressed():
	InvItemID = 19
	ItemCat = "'Hat'"
	Equipped()
	updootButone()

func _on_equip_itm_20_pressed():
	InvItemID = 20
	ItemCat = "'Shirt'"
	Equipped()
	updootButone()

func _on_invent_anim_animation_finished(anim_name):
	if(anim_name == "transOut"):
		get_tree().paused = false
		get_tree().reload_current_scene()

func updootButone():
	itm1()
	itm2()
	itm3()
	itm4()
	itm5()
	itm6()
	itm7()
	itm8()
	itm9()
	itm10()
	itm11()
	itm12()
	itm13()
	itm14()
	itm15()
	itm16()
	itm17()
	itm18()
	itm19()
	itm20()
	
#On action events
#//............................................................................

func SaveMeUwU(x):
	Global.Db.open_db()
	Global.Db.query("SELECT ItemID FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Character';")
	for i in range(0, Global.Db.query_result.size()):
		charz.append(Global.Db.query_result[i])
	Global.Db.query("SELECT ItemID FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Hat';")
	for i in range(0, Global.Db.query_result.size()):
		hat.append(Global.Db.query_result[i])
	Global.Db.query("SELECT ItemID FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Background';")
	for i in range(0, Global.Db.query_result.size()):
		back.append(Global.Db.query_result[i])
	Global.Db.query("SELECT ItemID FROM Inventory WHERE EquipStatus = 2 AND ItemCat = 'Shirt';")
	for i in range(0, Global.Db.query_result.size()):
		shirt.append(Global.Db.query_result[i])
	
	if(charz.is_empty()):
		charz.append(default)
	if(hat.is_empty()):
		hat.append(default)
	if(shirt.is_empty()):
		shirt.append(default)
	if(back.is_empty()):
		back.append(default)
	
	if(charz[0]["ItemID"] == 0):
		charz[0]["ItemID"] = 911
	Global.Db.query("UPDATE SavedCharas SET AccessoryID = "+str(hat[0]["ItemID"])+", ShirtID = "+str(shirt[0]["ItemID"])+", BgID = "+str(back[0]["ItemID"])+", CharaName = '"+str(x)+"', SavedStatus = 2 WHERE CharacterID = "+str(charz[0]["ItemID"])+";")
	Global.Db.close_db()

func _on_saved_charas_pressed():
	get_node("SavedCharas/SavedCharaLayer/SVAnim").play("transIn")


func _on_save_save_save_pressed():
	$PopupPopup.visible = true

func _on_popup_popup_confirmed():
	SaveMeUwU($PopupPopup/NameInput.text)
	$PopupPopup/NameInput.text = ""
	$SavedCharas/SavedCharaLayer._ready()


extends CanvasLayer

#//............................................................................
#variables
var gowld
var UserData = []
var inventori = []
var itemPrice
var ShopItemStatus
var InvItemStatus
var itemID
var buttonName
var queryResult
var rows
#variables
#//............................................................................

# Called when the node enters the scene tree for the first time.
func _ready():
	getData() #Prepares some function that requires user data
	
	#//
	#item call
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
	#item call
	#//
	
	$Coinz.text = str(gowld)
	$CoinAnim.play("new_animation")

#//............................................................................
#Item functionalities: Checks if item is already bought or not
func itm1():
	itemID = 1
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/PanelBull/BuyItm1
	ItemBought()

func itm2():
	itemID = 2
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelHat/BuyItm2
	ItemBought()

func itm3():
	itemID = 3
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelShirt/BuyItm3
	ItemBought()

func itm4():
	itemID = 4
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/PanelWoods/BuyItm4
	ItemBought()

func itm5():
	itemID = 5
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/PanelTiger/BuyItm5
	ItemBought()

func itm6():
	itemID = 6
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/PanelPanda/BuyItm6
	ItemBought()

func itm7():
	itemID = 7
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelOrientalHairClip/BuyItm7
	ItemBought()

func itm8():
	itemID = 8
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelOrientalDress/BuyItm8
	ItemBought()

func itm9():
	itemID = 9
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/PanelBambooForest/BuyItm9
	ItemBought()

func itm10():
	itemID = 10
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelSpaceBeret/BuyItm10
	ItemBought()

func itm11():
	itemID = 11
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelSpaceBlouse/BuyItm11
	ItemBought()

func itm12():
	itemID = 12
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/PanelMoonStation/BuyItm12
	ItemBought()

func itm13():
	itemID = 13
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/PanelAxolotl/BuyItm13
	ItemBought()

func itm14():
	itemID = 14
	buttonName = $TabContainer/Characters/RichTextLabel/ControlNod/PanelBeardedDragon/BuyItm14
	ItemBought()

func itm15():
	itemID = 15
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/PanelBeachSide/BuyItm15
	ItemBought()

func itm16():
	itemID = 16
	buttonName = $TabContainer/Backgrounds/RichTextLabel/ControlNod/PanelRedCarpet/BuyItm16
	ItemBought()

func itm17():
	itemID = 17
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelSnorkel/BuyItm17
	ItemBought()

func itm18():
	itemID = 18
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelLifeVest/BuyItm18
	ItemBought()

func itm19():
	itemID = 19
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelFedora/BuyItm19
	ItemBought()

func itm20():
	itemID = 20
	buttonName = $TabContainer/Accessories/RichTextLabel/ControlNod/PanelTuxedo/BuyItm20
	ItemBought()

#Item functionalities
#//............................................................................


#//............................................................................
#Shop functionalities
func _on_close_shop_pressed():
	get_node("ShopAnim").play("transOut")

func getData():
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		gowld = UserData[0]["CurrencyAmt"]

func BuyItem():
	Global.Db.open_db()
	Global.Db.query("Update Shop Set ItemStatus = "+str(ShopItemStatus)+" Where ItemID = "+str(itemID)+";")
	Global.Db.query("Update Inventory Set AvailStatus = "+str(InvItemStatus)+" Where ItemID = "+str(itemID)+";")
	Global.Db.query("Update PlayerData Set CurrencyAmt = CurrencyAmt - (Select ItemPrice From Shop Where ItemID = "+str(itemID)+") Where pID = 1;")
	Global.Db.close_db()
	call("itm"+str(itemID)) #recall item function to update textures

func acceptAmount(): #if user has enough gold, gets buy function
	if (gowld >= itemPrice):
		$BuySound.play()
		gowld -= itemPrice
		$Coinz.text = str(gowld)
		BuyItem()
		
	else:
		$Popup/Label.text = "You need "+str(itemPrice)+" coins to buy this item."
		$Popup/Label.visible = true

func ItemBought(): #sets button property
	Global.Db.open_db()
	Global.Db.query('SELECT ItemStatus FROM Shop WHERE ItemID = '+str(itemID)+';')
	queryResult = Global.Db.query_result[0]
	ShopItemStatus = queryResult["ItemStatus"]
	if (ShopItemStatus == 1):
		buttonName.text = "Bought"
		buttonName.disabled = true
	elif (ShopItemStatus == 2):
		buttonName.text = "Buy"
		buttonName.disabled = false
	Global.Db.close_db()

#Shop functionalities
#//............................................................................


#//............................................................................
#On action events
func _on_buy_itm_1_pressed():
	itemID = 1
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_2_pressed():
	itemID = 2
	itemPrice = 20
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_3_pressed():
	itemID = 3
	itemPrice = 60
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_4_pressed():
	itemID = 4
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_5_pressed():
	itemID = 5
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_6_pressed():
	itemID = 6
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_7_pressed():
	itemID = 7
	itemPrice = 20
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_8_pressed():
	itemID = 8
	itemPrice = 60
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_9_pressed():
	itemID = 9
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_10_pressed():
	itemID = 10
	itemPrice = 20
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_11_pressed():
	itemID = 11
	itemPrice = 60
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_12_pressed():
	itemID = 12
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_13_pressed():
	itemID = 13
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_14_pressed():
	itemID = 14
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_15_pressed():
	itemID = 15
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_16_pressed():
	itemID = 16
	itemPrice = 100
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_17_pressed():
	itemID = 17
	itemPrice = 20
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_18_pressed():
	itemID = 18
	itemPrice = 60
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_19_pressed():
	itemID = 19
	itemPrice = 20
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_buy_itm_20_pressed():
	itemID = 20
	itemPrice = 60
	ShopItemStatus = 1
	InvItemStatus = 2
	acceptAmount()

func _on_shop_anim_animation_finished(anim_name):
	if(anim_name == "transOut"):
		get_tree().paused = false
		get_tree().reload_current_scene()

#On action events
#//............................................................................

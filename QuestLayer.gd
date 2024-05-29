extends CanvasLayer
var UserData = []
var Daily = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.play("default")
	getData()
	getDaily()
	Disability()

# For spscific user data
func getData():
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()

# For daily quest table in database
func getDaily():
		Global.Db.open_db()
		var table = "Daily"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			Daily.append(Global.Db.query_result[i])
		Global.Db.close_db()

#//............................................................................
#On action events

func _on_close_quest_pressed():
	get_node("QuestAnim").play("transOut")

func _on_claim_pressed():
	$Claim.disabled = true
	$Claim.text = "Claimed"
	Reward(20)
	ResetQuest()

func _on_quest_anim_animation_finished(anim_name):
	if(anim_name == "transOut"):
		get_tree().paused = false
		get_tree().reload_current_scene()

#On action events
#//............................................................................

# Inserts reward amount to user coins
func Reward(x: int):
	Global.Db.open_db()
	var table = "PlayerData"
	Global.Db.query("Update "+table+" Set CurrencyAmt = CurrencyAmt + "+str(x)+" Where pID = 1;")
	Global.Db.close_db()
	getData()

# Disables button upon claiming
func Disability():
	if(Time.get_date_string_from_system(false) != Daily[0]["Date"] && Daily[0]["Status"] == 1):
		$Claim.disabled = false
	else:
		$Claim.disabled = true
		$Claim.text = "Claimed"

# Resets claimed quest upon set time
func ResetQuest():
		Global.Db.open_db()
		var table = "Daily"
		Global.Db.query("Update "+ table +" Set Status = 0 Where DailyID = 1;")
		Global.Db.query("Update "+ table +" Set Date = '"+Time.get_date_string_from_system(false)+"' Where DailyID = 1;")
		Global.Db.close_db()

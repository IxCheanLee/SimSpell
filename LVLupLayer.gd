extends CanvasLayer
var UserData = []
var lvlNiPlayah

# Plays animation and changes text over user current level
func _ready():
	getData()
	AnongLebel()
	$LvlLowgo.play("lvlUPlowgo")

func _on_close_correct_pressed():
		get_node("LVLupAnim").play("transOut")

func getData():
		UserData = []
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		lvlNiPlayah = UserData[0]["DifficultyVal"]

func AnongLebel():
	$Lebel.text = "You are now Level "+str(lvlNiPlayah+1)

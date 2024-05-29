extends CanvasLayer
var UserData = []
var lvlNiPlayah
var expNiPlayah

# Called when the node enters the scene tree for the first time.
func _ready():
	getData()
	$Coinzzz.play("coinzzzz")
	changeCoinAMT()
	$Experyenzzzzzz.play("ekspi")
	changeEXPAMT()

func _on_close_correct_pressed():
		getData()
		var random = randi()%4+1
		
		if (lvlNiPlayah == 0):
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
				
		get_node("CorrectAnim").play("transOut")
		get_tree().paused = false

func changeCoinAMT():
	if (lvlNiPlayah == 1):
		$coinlebel.text = "+ 10"
	elif (lvlNiPlayah == 2):
		$coinlebel.text = "+ 20"
	elif (lvlNiPlayah == 3):
		$coinlebel.text = "+ 30"
	elif (lvlNiPlayah == 0):
		$coinlebel.text = "+ 5"
	else:
		$coinlebel.text = "+ 35"

func changeEXPAMT():
	if (lvlNiPlayah == 1):
		$explebel.text = "+ 10"
	elif (lvlNiPlayah == 2):
		$explebel.text = "+ 20"
	elif (lvlNiPlayah == 3):
		$explebel.text = "+ 25"
	elif (lvlNiPlayah == 0):
		$explebel.text = "+ 5"
	else:
		$explebel.text = "+ 35"

func getData():
		UserData = []
		Global.Db.open_db()
		var table = "PlayerData"
		Global.Db.query("Select * from "+ table+";")
		for i in range(0, Global.Db.query_result.size()):
			UserData.append(Global.Db.query_result[i])
		Global.Db.close_db()
		lvlNiPlayah = UserData[0]["DifficultyVal"]
		expNiPlayah = UserData[0]["EXPpts"]

func _on_correct_anim_animation_finished(_anim_name):
	getData()
	print(str(expNiPlayah)+"CorrectLayer")
	if(expNiPlayah >= 100):
		Global.lvlUP()
		get_node("LVLupLayer/LVLupAnim").play("transIn")
		get_node("LVLupLayer/LvlUpSound").play()

func _on_correct_anim_animation_started(anim_name):
	if(anim_name == "transIn"):
		$CorrectSound.play()

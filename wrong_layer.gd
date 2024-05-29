extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_close_wrong_pressed():
	get_node("WrongAnim").play("transOut")


func _on_wrong_anim_animation_started(anim_name):
	if(anim_name == "transIn"):
		$WrongSound.play()

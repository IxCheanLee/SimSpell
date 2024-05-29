extends CanvasLayer
var bg = AudioServer.get_bus_index("BGMusicBus")
var audio = AudioServer.get_bus_index("AudioCues")
var master = AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label/HSliderBG.value = Global.volume1
	$Label2/HSliderGame.value = Global.volume2
	if(AudioServer.is_bus_mute(master)):
			$Mute.visible = false
			$UnMute.visible = true
	else:
			$UnMute.visible = false
			$Mute.visible = true

func _process(_delta):
	pass

func _on_close_menu_pressed():
	get_node("MenuAnim").play("transOut")

func _on_h_slider_value_changed(value):
	Global.volume1 = $Label/HSliderBG.value
	AudioServer.set_bus_volume_db(bg, value)

func _on_reset_game_pressed():
	Global.reset()

func _on_quit_game_pressed():
	get_tree().quit(0)

func _on_h_slider_game_value_changed(value):
	Global.volume2 = $Label2/HSliderGame.value
	AudioServer.set_bus_volume_db(audio, value)

func _on_mute_pressed():
	AudioServer.set_bus_mute(master, true)
	$Mute.visible = false
	$UnMute.visible = true

func _on_un_mute_pressed():
	AudioServer.set_bus_mute(master, false)
	$UnMute.visible = false
	$Mute.visible = true

func _on_menu_anim_animation_finished(anim_name):
	if(anim_name == "transOut"):
		get_tree().paused = false
		get_tree().reload_current_scene()

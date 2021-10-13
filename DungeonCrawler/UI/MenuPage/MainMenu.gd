extends Control

var scene_path_to_load

# Loads on startup
func _ready():
	$ButtonContainer/PlayLevelButton.grab_focus() # adding keyboard support (set focus on the 1st button)
	for button in $ButtonContainer.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

	# Hides the Tutorial Popup initially
	$TutorialPopup.visible = false
	$LogoutConfirmation.visible = false

# Changing scene
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in() 

# Signal after fade finishes
# User will be redirected accordingly
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

# Tutorial pop up 
func _on_TutorialButton_pressed():
	$TutorialPopup/DragCodeBlocks.popup_centered()

	
func _on_LogoutButton_pressed():
	$LogoutConfirmation/LogoutConfirmationDialog.popup_centered()

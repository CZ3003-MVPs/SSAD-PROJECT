extends Control

# Triggers when close button is pressed
func _on_CloseButton_pressed():
	$DragCodeBlocks.visible = false
	$ResetAndStop.visible = false
	$RunCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = false
	$LevelCompletion.visible = false

# Moves to the DeleteCodeBlocks tutorial page
func _on_NextButton1_pressed():
	$DragCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = true

# Moves to the Run Code Block tutorial page
func _on_NextButton2_pressed():
	$DeleteCodeBlocks.visible = false
	$RunCodeBlocks.visible = true

# Moves to the ResetAndStop Completion tutorial page
func _on_NextButton3_pressed():
	$RunCodeBlocks.visible = false
	$ResetAndStop.visible = true
	
# Moves to LevelCompletion tutorial page
func _on_NextButton4_pressed():
	$ResetAndStop.visible = false
	$LevelCompletion.visible = true

# Moves back to DragCodeBlock tutorial page
func _on_PrevButton2_pressed():
	$DeleteCodeBlocks.visible = false
	$DragCodeBlocks.visible = true
	
# Moves back to the DeleteCodeBlocks Code Block tutorial page
func _on_PrevButton3_pressed():
	$RunCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = true

# Moves back to RunCodeBlocks tutorial page
func _on_PrevButton4_pressed():
	$ResetAndStop.visible = false
	$RunCodeBlocks.visible = true 

# Moves back to the ResetAndStop Code Block tutorial page
func _on_PrevButton5_pressed():
	$LevelCompletion.visible = false
	$ResetAndStop.visible = true










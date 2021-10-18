extends Control

func _on_CloseButton_pressed():
	$DragCodeBlocks.visible = false
	$ResetAndStop.visible = false
	$RunCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = false
	$LevelCompletion.visible = false

# Moving to the DeleteCodeBlocks tutorial page
func _on_NextButton1_pressed():
	$DragCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = true

# Moving to the Run Code Block tutorial page 
func _on_NextButton2_pressed():
	$DeleteCodeBlocks.visible = false
	$RunCodeBlocks.visible = true

# Moving to the ResetAndStop Completion tutorial page 
func _on_NextButton3_pressed():
	$RunCodeBlocks.visible = false
	$ResetAndStop.visible = true
	
# Moving to LevelCompletion tutorial page 
func _on_NextButton4_pressed():
	$ResetAndStop.visible = false
	$LevelCompletion.visible = true

# Moving back to DragCodeBlock tutorial page
func _on_PrevButton2_pressed():
	$DeleteCodeBlocks.visible = false
	$DragCodeBlocks.visible = true
	
# Moving back to the DeleteCodeBlocks Code Block tutorial page 
func _on_PrevButton3_pressed():
	$RunCodeBlocks.visible = false
	$DeleteCodeBlocks.visible = true

# Moving back to RunCodeBlocks tutorial page 
func _on_PrevButton4_pressed():
	$ResetAndStop.visible = false
	$RunCodeBlocks.visible = true 

# Moving back to the ResetAndStop Code Block tutorial page 
func _on_PrevButton5_pressed():
	$LevelCompletion.visible = false
	$ResetAndStop.visible = true










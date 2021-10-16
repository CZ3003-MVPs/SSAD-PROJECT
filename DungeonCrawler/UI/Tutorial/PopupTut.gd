extends Control

func _on_CloseButton_pressed():
	$DragCodeBlocks.visible = false
	$DeleteAndReset.visible = false
	$RunCodeBlocks.visible = false
	$LevelCompletion.visible = false

# Moving to the DeleteAndReset tutorial page
func _on_NextButton1_pressed():
	$DragCodeBlocks.visible = false
	$DeleteAndReset.visible = true

# Moving to the Run Code Block tutorial page 
func _on_NextButton2_pressed():
	$DeleteAndReset.visible = false
	$RunCodeBlocks.visible = true

# Moving to the Level Completion tutorial page 
func _on_NextButton3_pressed():
	$RunCodeBlocks.visible = false
	$LevelCompletion.visible = true

# Moving back to DragCodeBlock tutorial page
func _on_PrevButton2_pressed():
	$DeleteAndReset.visible = false
	$DragCodeBlocks.visible = true
	
# Moving back to the DeleteAndReset Code Block tutorial page 
func _on_PrevButton3_pressed():
	$RunCodeBlocks.visible = false
	$DeleteAndReset.visible = true

# Moving back to the Run Code Block tutorial page 
func _on_PrevButton4_pressed():
	$LevelCompletion.visible = false
	$RunCodeBlocks.visible = true





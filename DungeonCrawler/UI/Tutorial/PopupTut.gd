extends Control

func _on_CloseButton_pressed():
	$DragCodeBlocks.visible = false
	$RunCodeBlocks.visible = false
	$LevelCompletion.visible = false

# Moving to the Run Code Block tutorial page 
func _on_NextButton1_pressed():
	$DragCodeBlocks.visible = false
	$RunCodeBlocks.visible = true

# Moving to the Level Completion tutorial page 
func _on_NextButton2_pressed():
	$RunCodeBlocks.visible = false
	$LevelCompletion.visible = true

# Moving to the Drag Code Block tutorial page 
func _on_PrevButton2_pressed():
	$RunCodeBlocks.visible = false
	$DragCodeBlocks.visible = true

# Moving to the Run Code Block tutorial page 
func _on_PrevButton3_pressed():
	$LevelCompletion.visible = false
	$RunCodeBlocks.visible = true


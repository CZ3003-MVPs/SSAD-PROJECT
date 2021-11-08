extends LineEdit

var regex = RegEx.new()
var oldtext = ""

# Runs on load
func _ready():
	regex.compile("^[1-9][0-9]*$")

# Runs on text change
func _on_LineEdit_text_changed(new_text):
	if regex.search(new_text) or text.empty():
		text = new_text   
		oldtext = text
	else:
		text = oldtext
	
	set_cursor_position(text.length())

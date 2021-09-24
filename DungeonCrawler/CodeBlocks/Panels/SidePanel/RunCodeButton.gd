extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal move_sprite(list_of_movements)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")
	#add_child(button)
	

func _button_pressed():
	print("--- RUNNING CODE BLOCKS! ---")
	var code_blocks = get_node("/root/TestLevelManager/UI/SidePanel/MainPanelToDropCodeBlocks")
#	print(code_blocks.get_name())
	for N in code_blocks.get_children():
#		print("[" + N.get_name() + "]")   # N = ColorRect
		var list_of_movements = []
		for M in N.get_children():
			print("[" + M.get_name() + "]")   # M = PanelToDropCodeBlock
			for P in M.get_children():
#				print("[" + P.get_name() + "]")   # P = OccupiedCodeBlock
				for L in P.get_children():
#					print("[" + L.get_name() + "]")  # L = WalkCodeBlock
					var movement_details = []
					for G in L.get_children():
						print("[" + G.get_name() + ", " + G.text + "]")
						movement_details.append(G.text)
					list_of_movements.append(movement_details)
		print("list_of_movements: " + str(list_of_movements))
		emit_signal("move_sprite", list_of_movements)


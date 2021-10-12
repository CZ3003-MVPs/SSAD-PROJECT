extends OptionButton


func make_option_button_items_non_radio_checkable() -> void:
	var pm: PopupMenu = get_popup()
	for i in pm.get_item_count():
		if pm.is_item_radio_checkable(i):
			pm.set_item_as_radio_checkable(i, false)

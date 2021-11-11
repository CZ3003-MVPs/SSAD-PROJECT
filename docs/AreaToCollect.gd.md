<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# AreaToCollect.gd

**Extends:** [Area2D](../Area2D)

## Description

This manages the area2d attached to the player.
It is used to detect if a key is on top of the player
when the collect code block is executed.

## Property Descriptions

### timer

```gdscript
var timer
```

## Method Descriptions

### collect

```gdscript
func collect() -> void
```

Checks input, collects if P
For debug purposes
func _input(event) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_P:
			collect()
Collects key if possible
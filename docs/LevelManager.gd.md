<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# LevelManager.gd

**Extends:** [Node2D](../Node2D)

## Description

## Property Descriptions

### background

```gdscript
var background
```

### panel\_to\_drop\_code\_blocks

```gdscript
var panel_to_drop_code_blocks
```

### side\_panel

```gdscript
var side_panel
```

### level\_node\_path

```gdscript
export var level_node_path = ""
```

### next\_level

```gdscript
export var next_level = "[Object:null]"
```

### level

```gdscript
var level
```

### end\_goal

```gdscript
var end_goal
```

### player

```gdscript
var player
```

### level\_complete\_pop\_up

```gdscript
var level_complete_pop_up
```

### quit\_level\_pop\_up

```gdscript
var quit_level_pop_up
```

### level\_statistics

```gdscript
var level_statistics
```

### no\_of\_code\_blocks

```gdscript
var no_of_code_blocks
```

### stopped\_code\_execution

```gdscript
var stopped_code_execution
```

### steps

```gdscript
var steps
```

level completion variables

### collisions

```gdscript
var collisions
```

level completion variables

### codeblocks

```gdscript
var codeblocks
```

## Method Descriptions

### on\_stopped\_code\_execution

```gdscript
func on_stopped_code_execution()
```

Stops code execution

### on\_reset\_stopped\_code\_execution

```gdscript
func on_reset_stopped_code_execution()
```

Resets code execution

### reset\_level

```gdscript
func reset_level()
```

Resets everything (player position, code blocks, gold)

### calculate\_no\_of\_code\_blocks

```gdscript
func calculate_no_of_code_blocks(list_of_instructions)
```

Gets the number of code blocks used

### on\_player\_reached\_end\_goal

```gdscript
func on_player_reached_end_goal() -> void
```

Triggers when end goal is reached

### on\_finished\_executing\_code

```gdscript
func on_finished_executing_code(statistics) -> void
```

The code for the pop up appearing needs to be here to tell player they failed lvl
Triggers when code finishes executing

### update\_statistics

```gdscript
func update_statistics(statistics)
```

Updates statistics

### restart\_level

```gdscript
func restart_level()
```

Restarts level

### go\_back\_to\_level\_selection

```gdscript
func go_back_to_level_selection()
```

Goes back to level selection

### go\_to\_next\_level

```gdscript
func go_to_next_level()
```

Goes to next level

### show\_quit\_dialog

```gdscript
func show_quit_dialog()
```

Shows quit dialog

## Signals

- signal statistics_ready(): 

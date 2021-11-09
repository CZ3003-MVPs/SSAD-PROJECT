<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Player.gd

**Extends:** [KinematicBody2D](../KinematicBody2D)

## Description

## Property Descriptions

### starting\_direction

```gdscript
export var starting_direction = ""
```

### animated\_sprite

```gdscript
var animated_sprite
```

### ray

```gdscript
var ray
```

### tween

```gdscript
var tween
```

### exclamation\_mark

```gdscript
var exclamation_mark
```

### area\_to\_collect

```gdscript
var area_to_collect
```

### starting\_position

```gdscript
var starting_position
```

### no\_of\_collisions

```gdscript
var no_of_collisions
```

### no\_of\_steps

```gdscript
var no_of_steps
```

### to\_terminate

```gdscript
var to_terminate
```

### inputs

```gdscript
var inputs
```

### grid\_size

```gdscript
var grid_size: int = 16
```

### can\_move

```gdscript
var can_move: bool = true
```

### default\_sprite\_animation\_duration

```gdscript
var default_sprite_animation_duration: float = 0.5
```

### sprite\_animation\_duration

```gdscript
var sprite_animation_duration: float = 0.5
```

## Method Descriptions

### reset\_sprite\_position

```gdscript
func reset_sprite_position() -> void
```

Resets sprite position to starting position

### move

```gdscript
func move(dir: String) -> void
```

Moves sprite according to direction given
Also checks for collision so that Sprite cannot walk into walls

### able\_to\_move

```gdscript
func able_to_move(dir: String)
```

Casts a ray to check if Sprite is able to move in the given direction
Returns true if movement in given direction will not result in collision
Returns false if movement in given direction will result in collision

### exclaim

```gdscript
func exclaim() -> void
```

Shows Pop-up when sprite collides

### collect

```gdscript
func collect() -> void
```

Collects item

### terminate

```gdscript
func terminate()
```

Terminates

### unterminate

```gdscript
func unterminate()
```

Undoes terminate

### toggle\_speed

```gdscript
func toggle_speed(speed)
```

Toggles speed

### check\_conditions

```gdscript
func check_conditions(movement_details)
```

Checks for IF/WHILE condition in code blocks

### single\_action

```gdscript
func single_action(movement_details)
```

Execution of Walk and Collect code blocks

### nested\_action

```gdscript
func nested_action(movement_details)
```

Execution of Repeat, While and If code blocks

### iterate\_thru\_nested\_blk

```gdscript
func iterate_thru_nested_blk(instructions: Array)
```

Iterate through instructions in nested blocks

## Signals

- signal finished_executing_code(): 

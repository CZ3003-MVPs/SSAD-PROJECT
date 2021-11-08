<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Leaderboard.gd

**Extends:** [Control](../Control)

## Description

## Property Descriptions

### scene\_path\_to\_load

```gdscript
var scene_path_to_load
```

### column

```gdscript
var column: VBoxContainer
```

### dropdown

```gdscript
var dropdown: OptionButton
```

### score\_row

```gdscript
export var score_row: PackedScene = "[PackedScene:19457]"
```

### title\_row

```gdscript
export var title_row: PackedScene = "[PackedScene:19463]"
```

## Method Descriptions

### delete\_current\_rows

```gdscript
func delete_current_rows() -> void
```

Clears current leaderboard

### add\_new\_rows

```gdscript
func add_new_rows(users: Array) -> void
```

Adds row to leaderboard

### get\_leaderboard

```gdscript
func get_leaderboard(level)
```

Gets entire leaderboard

### refresh\_leaderboard

```gdscript
func refresh_leaderboard(result)
```

Refreshes leaderboard

### add\_title\_row

```gdscript
func add_title_row()
```

Add the top row of leaderboard

### add\_dropdown\_options

```gdscript
func add_dropdown_options(max_level)
```

Add leaderboard display options

## Signals

- signal leaderboard(): 

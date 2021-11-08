<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SpaceToDropCodeBlock.gd

**Extends:** [TextureRect](../TextureRect)

## Description

## Property Descriptions

### visual\_aid

```gdscript
var visual_aid: ColorRect
```

### occupied\_code\_block

```gdscript
var occupied_code_block: Control
```

### is\_original\_space

```gdscript
var is_original_space: bool = true
```

## Method Descriptions

### get\_drag\_data

```gdscript
func get_drag_data(position)
```

Retrieve info about the item we are dragging

### can\_drop\_data

```gdscript
func can_drop_data(position, data)
```

Checks if data can be dropped

### drop\_data

```gdscript
func drop_data(position, data)
```

Checks for drop data

### is\_occupied

```gdscript
func is_occupied() -> bool
```

Checks if occupied

### increase\_rect\_min\_size

```gdscript
func increase_rect_min_size(added_code_blk_wrapper: bool) -> void
```

Increases rectangle minimum size

### decrease\_rect\_min\_size

```gdscript
func decrease_rect_min_size(rect_min_size_to_decrease: float) -> void
```

Decreases rectangle minimum size

### get\_occupied\_code\_block

```gdscript
func get_occupied_code_block() -> Node
```

Gets occupied code block

## Signals

- signal occupied_space(): 

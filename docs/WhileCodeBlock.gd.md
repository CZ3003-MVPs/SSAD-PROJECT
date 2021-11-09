<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WhileCodeBlock.gd

**Extends:** [BaseCodeBlock](../BaseCodeBlock) < [NinePatchRect](../NinePatchRect)

## Description

## Property Descriptions

### indented\_space

```gdscript
export var indented_space = "[Object:null]"
```

### label

```gdscript
var label: Label
```

### can\_option\_button

```gdscript
var can_option_button: OptionButton
```

### walk\_direction\_option\_button

```gdscript
var walk_direction_option_button: OptionButton
```

### spaces

```gdscript
var spaces: VBoxContainer
```

## Method Descriptions

### create\_new\_space

```gdscript
func create_new_space(added_code_blk_wrapper: bool) -> void
```

Creates new space

### delete\_space\_which\_discarded\_block\_originated

```gdscript
func delete_space_which_discarded_block_originated(data_dict_of_discarded_block) -> void
```

Deletes space of the discarded block

### get\_instruction

```gdscript
func get_instruction()
```

Gets instructions in while code block

### get\_reference\_to\_occupied\_code\_block\_based\_on\_space\_index

```gdscript
func get_reference_to_occupied_code_block_based_on_space_index(space_index: int) -> Node
```

Reads the instructions of the code bloks within this while code block

### get\_no\_of\_code\_blocks

```gdscript
func get_no_of_code_blocks()
```

Gets number of code blocks

## Signals

- signal created_new_space_in_code_block_wrapper(added_code_blk_wrapper): 
- signal deleted_new_space_in_code_block_wrapper(rect_min_size_to_delete): 

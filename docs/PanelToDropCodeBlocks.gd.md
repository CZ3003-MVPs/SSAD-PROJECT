<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# PanelToDropCodeBlocks.gd

**Extends:** [Control](../Control)

## Description

## Property Descriptions

### space

```gdscript
export var space = "[Object:null]"
```

### spaces

```gdscript
var spaces
```

## Method Descriptions

### create\_new\_space

```gdscript
func create_new_space() -> void
```

Create new space to drop code blocks

### delete\_space\_which\_discarded\_block\_originated

```gdscript
func delete_space_which_discarded_block_originated(data_dict_of_discarded_block) -> void
```

Delete space occupied previously after a code block has been discarded

### read\_code\_blocks

```gdscript
func read_code_blocks() -> void
```

Reads and converts the information in code blocks into a list of instructions

### count\_code\_blocks

```gdscript
func count_code_blocks()
```

Get the count of the number of code blocks in the panel

## Signals

- signal notify_sprite(list_of_movements): 

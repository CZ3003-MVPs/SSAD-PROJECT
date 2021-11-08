<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# method\_maker.gd

## Constants Descriptions

### PARAM\_PREFIX

```gdscript
const PARAM_PREFIX: String = "p_"
```

## Method Descriptions

### get\_function\_text

```gdscript
func get_function_text(meta)
```

###############
Public
###############
Creates a delceration for a function based off of function metadata.  All
types whose defaults are supported will have their values.  If a datatype
is not supported and the parameter has a default, a warning message will be
printed and the declaration will return null.

### get\_super\_call\_text

```gdscript
func get_super_call_text(meta)
```

creates a call to the function in meta in the super's class.

### get\_spy\_call\_parameters\_text

```gdscript
func get_spy_call_parameters_text(meta)
```

### get\_logger

```gdscript
func get_logger()
```

### set\_logger

```gdscript
func set_logger(logger)
```


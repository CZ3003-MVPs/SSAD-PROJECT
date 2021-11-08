<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseDynamicLinks

**Extends:** [Node](../Node)

## Description

# @meta-authors TODO
# @meta-authors TODO
# @meta-version 1.1
# The dynamic links API for Firebase
# Documentation TODO.

## Enumerations

### Requests

```gdscript
const Requests: Dictionary = {"GENERATE":0,"NONE":-1}
```

## Property Descriptions

### request

```gdscript
var request: int = -1
```

## Method Descriptions

### generate\_dynamic\_link

```gdscript
func generate_dynamic_link(long_link: String, APN: String, IBI: String, is_unguessable: bool) -> void
```

# @args log_link, APN, IBI, is_unguessable
# This function is used to generate a dynamic link using the Firebase REST API
# It will return a JSON with the shortened link

## Signals

- signal dynamic_link_generated(link_result): 

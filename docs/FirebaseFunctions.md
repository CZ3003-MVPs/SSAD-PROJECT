<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseFunctions

**Extends:** [Node](../Node)

## Description

# @meta-authors Nicolò 'fenix' Santilio,
# @meta-version 2.5
#
# (source: [url=https://firebase.google.com/docs/functions]Functions[/url])
#
# @tutorial https://github.com/GodotNuts/GodotFirebase/wiki/Functions

## Constants Descriptions

### CACHE\_SIZE\_UNLIMITED

```gdscript
const CACHE_SIZE_UNLIMITED: int = -1
```

TODO: Implement cache size limit

## Property Descriptions

### request

```gdscript
var request: int = -1
```

# The code indicating the request Firestore is processing.
# See @[enum FirebaseFirestore.Requests] to get a full list of codes identifiers.
# @enum Requests

### persistence\_enabled

```gdscript
var persistence_enabled: bool = true
```

# Whether cache files can be used and generated.
# @default true

### networking

```gdscript
var networking: bool = true
```

- **Setter**: `set_networking`

# Whether an internet connection can be used.
# @default true

### auth

```gdscript
var auth: Dictionary
```

# A Dictionary containing all authentication fields for the current logged user.
# @type Dictionary

## Method Descriptions

### execute

```gdscript
func execute(function: String, method: int, params: Dictionary, body: Dictionary) -> FunctionTask
```

# @args
# @return FunctionTask

### set\_networking

```gdscript
func set_networking(value: bool) -> void
```

### enable\_networking

```gdscript
func enable_networking() -> void
```

### disable\_networking

```gdscript
func disable_networking() -> void
```

## Signals

- signal task_error(code, status, message): # Emitted when a  [code]query()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a [code]list()[/code] or [code]query()[/code] request is [b]not[/b] successfully completed.

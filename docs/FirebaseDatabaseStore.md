<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseDatabaseStore

**Extends:** [Node](../Node)

## Description

# @meta-authors TODO
# @meta-version 2.2
# Data structure that holds the currently-known data at a given path (a.k.a. reference) in a Firebase Realtime Database.
# Can process both puts and patches into the data based on realtime events received from the service.

## Property Descriptions

### debug

```gdscript
var debug: bool = false
```

# @default false
# Whether the store is in debug mode.

## Method Descriptions

### put

```gdscript
func put(path: String, payload) -> void
```

# @args path, payload
# Puts a new payload into this data store at the given path. Any existing values in this data store
# at the specified path will be completely erased.

### patch

```gdscript
func patch(path: String, payload) -> void
```

# @args path, payload
# Patches an update payload into this data store at the specified path.
# NOTE: When patching in updates to arrays, payload should contain the entire new array! Updating single elements/indexes of an array is not supported. Sometimes when manually mutating array data directly from the Firebase Realtime Database console, single-element patches will be sent out which can cause issues here.

### get\_data

```gdscript
func get_data() -> Dictionary
```

# Returns a deep copy of this data store's payload.
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseDatabaseReference

**Extends:** [Node](../Node)

## Description

# @meta-authors TODO
# @meta-version 2.3
# A reference to a location in the Realtime Database.
# Documentation TODO.

## Constants Descriptions

### END\_AT

```gdscript
const END_AT: String = "endAt"
```

### EQUAL\_TO

```gdscript
const EQUAL_TO: String = "equalTo"
```

### LIMIT\_TO\_FIRST

```gdscript
const LIMIT_TO_FIRST: String = "limitToFirst"
```

### LIMIT\_TO\_LAST

```gdscript
const LIMIT_TO_LAST: String = "limitToLast"
```

### ORDER\_BY

```gdscript
const ORDER_BY: String = "orderBy"
```

### START\_AT

```gdscript
const START_AT: String = "startAt"
```

## Method Descriptions

### set\_db\_path

```gdscript
func set_db_path(path: String, filter_query_dict: Dictionary) -> void
```

### set\_auth\_and\_config

```gdscript
func set_auth_and_config(auth_ref: Dictionary, config_ref: Dictionary) -> void
```

### set\_pusher

```gdscript
func set_pusher(pusher_ref: HTTPRequest) -> void
```

### set\_listener

```gdscript
func set_listener(listener_ref: Node) -> void
```

### on\_new\_sse\_event

```gdscript
func on_new_sse_event(headers: Dictionary, event: String, data: Dictionary) -> void
```

### set\_store

```gdscript
func set_store(store_ref: FirebaseDatabaseStore) -> void
```

### update

```gdscript
func update(path: String, data: Dictionary) -> void
```

### push

```gdscript
func push(data: Dictionary) -> void
```

### get\_data

```gdscript
func get_data() -> Dictionary
```

Returns a deep copy of the current local copy of the data stored at this reference in the Firebase
Realtime Database.

### on\_push\_request\_complete

```gdscript
func on_push_request_complete(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void
```

## Signals

- signal new_data_update(data): 
- signal patch_data_update(data): 
- signal push_successful(): 
- signal push_failed(): 

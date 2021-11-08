<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FunctionTask

**Extends:** [Reference](../Reference)

## Description

# @meta-authors Nicolò 'fenix' Santilio,
# @meta-version 1.2
#
# ex.
# [code]var task : FirestoreTask = Firebase.Firestore.query(query)[/code]
# [code]var result : Array = yield(task, "task_finished")[/code]
# [code]var result : Array = yield(task, "result_query")[/code]
# [code]var result : Array = yield(Firebase.Firestore, "task_finished")[/code]
# [code]var result : Array = yield(Firebase.Firestore, "result_query")[/code]
#
# @tutorial https://github.com/GodotNuts/GodotFirebase/wiki/Firestore#FirestoreTask

## Property Descriptions

### data

```gdscript
var data: Dictionary
```

# A variable, temporary holding the result of the request.

### error

```gdscript
var error: Dictionary
```

# A variable, temporary holding the result of the request.

### from\_cache

```gdscript
var from_cache: bool = false
```

# Whether the data came from cache.

## Signals

- signal task_finished(result): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
- signal function_executed(response, result): # Emitted when a cloud function is correctly executed, returning the Response Code and Result Body
# @arg-types FirestoreDocument
- signal task_error(code, status, message): # Emitted when a request is [b]not[/b] successfully completed.
# @arg-types Dictionary

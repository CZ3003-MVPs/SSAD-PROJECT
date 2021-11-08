<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirestoreTask

**Extends:** [Reference](../Reference)

## Description

# @meta-authors Nicolò 'fenix' Santilio,
# @meta-version 1.2
#
# A [code]FirestoreTask[/code] is an indipendent node inheriting [code]HTTPRequest[/code] that processes a [code]Firestore[/code] request.
# Once the Task is completed (both if successfully or not) it will emit the relative signal (or a general purpose signal [code]task_finished()[/code]) and will destroy automatically.
#
# Being a [code]Node[/code] it can be stored in a variable to yield on it, and receive its result as a callback.
# All signals emitted by a [code]FirestoreTask[/code] represent a direct level of signal communication, which can be high ([code]get_document(document), result_query(result)[/code]) or low ([code]task_finished(result)[/code]).
# An indirect level of communication with Tasks is also provided, redirecting signals to the [class FirebaseFirestore] module.
#
# ex.
# [code]var task : FirestoreTask = Firebase.Firestore.query(query)[/code]
# [code]var result : Array = yield(task, "task_finished")[/code]
# [code]var result : Array = yield(task, "result_query")[/code]
# [code]var result : Array = yield(Firebase.Firestore, "task_finished")[/code]
# [code]var result : Array = yield(Firebase.Firestore, "result_query")[/code]
#
# @tutorial https://github.com/GodotNuts/GodotFirebase/wiki/Firestore#FirestoreTask

## Enumerations

### Task

```gdscript
const Task: Dictionary = {"TASK_DELETE":3,"TASK_GET":0,"TASK_LIST":5,"TASK_PATCH":2,"TASK_POST":1,"TASK_QUERY":4}
```

## Property Descriptions

### action

```gdscript
var action: int = -1
```

- **Setter**: `set_action`

# The code indicating the request Firestore is processing.
# See @[enum FirebaseFirestore.Requests] to get a full list of codes identifiers.
# @setter set_action

### data

```gdscript
var data
```

# A variable, temporary holding the result of the request.

### from\_cache

```gdscript
var from_cache: bool = false
```

# Whether the data came from cache.

## Method Descriptions

### set\_action

```gdscript
func set_action(value: int) -> void
```

## Signals

- signal task_finished(result): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
- signal add_document(doc): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
- signal get_document(doc): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
- signal update_document(doc): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
- signal delete_document(): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]delete(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
- signal listed_documents(documents): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]delete(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]list(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
- signal result_query(result): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]delete(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]list(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a [code]query(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
- signal task_error(code, status, message): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]delete(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]list(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a [code]query(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a request is [b]not[/b] successfully completed.
# @arg-types Dictionary
- signal task_query_error(code, status, message): # Emitted when a request is completed. The request can be successful or not successful: if not, an [code]error[/code] Dictionary will be passed as a result.
# @arg-types Variant
# Emitted when a [code]add(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]get(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]update(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]delete(document)[/code] request on a [class FirebaseCollection] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types FirestoreDocument
# Emitted when a [code]list(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a [code]query(collection_id)[/code] request on [class FirebaseFirestore] is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a request is [b]not[/b] successfully completed.
# @arg-types Dictionary
- signal task_list_error(code, status, message): 

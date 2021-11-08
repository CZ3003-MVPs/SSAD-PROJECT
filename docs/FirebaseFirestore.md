<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseFirestore

**Extends:** [Node](../Node)

## Description

# @meta-authors Nicolò 'fenix' Santilio,
# @meta-version 2.5
#
# Referenced by [code]Firebase.Firestore[/code]. Represents the Firestore module.
# Cloud Firestore is a flexible, scalable database for mobile, web, and server development from Firebase and Google Cloud.
# Like Firebase Realtime Database, it keeps your data in sync across client apps through realtime listeners and offers offline support for mobile and web so you can build responsive apps that work regardless of network latency or Internet connectivity. Cloud Firestore also offers seamless integration with other Firebase and Google Cloud products, including Cloud Functions.
#
# Following Cloud Firestore's NoSQL data model, you store data in [b]documents[/b] that contain fields mapping to values. These documents are stored in [b]collections[/b], which are containers for your documents that you can use to organize your data and build queries.
# Documents support many different data types, from simple strings and numbers, to complex, nested objects. You can also create subcollections within documents and build hierarchical data structures that scale as your database grows.
# The Cloud Firestore data model supports whatever data structure works best for your app.
#
# (source: [url=https://firebase.google.com/docs/firestore]Firestore[/url])
#
# @tutorial https://github.com/GodotNuts/GodotFirebase/wiki/Firestore

## Enumerations

### Requests

```gdscript
const Requests: Dictionary = {"LIST":0,"NONE":-1,"QUERY":1}
```

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

### collections

```gdscript
var collections: Dictionary
```

# A Dictionary containing all collections currently referenced.
# @type Dictionary

### auth

```gdscript
var auth: Dictionary
```

# A Dictionary containing all authentication fields for the current logged user.
# @type Dictionary

## Method Descriptions

### collection

```gdscript
func collection(path: String) -> FirestoreCollection
```

# Returns a reference collection by its [i]path[/i].
#
# The returned object will be of [code]FirestoreCollection[/code] type.
# If saved into a variable, it can be used to issue requests on the collection itself.
# @args path
# @return FirestoreCollection

### query

```gdscript
func query(query: FirestoreQuery) -> FirestoreTask
```

# Issue a query on your Firestore database.
#
# [b]Note:[/b] a [code]FirestoreQuery[/code] object needs to be created to issue the query.
# This method will return a [code]FirestoreTask[/code] object, representing a reference to the request issued.
# If saved into a variable, the [code]FirestoreTask[/code] object can be used to yield on the [code]result_query(result)[/code] signal, or the more generic [code]task_finished(result)[/code] signal.
#
# ex.
# [code]var query_task : FirestoreTask = Firebase.Firestore.query(FirestoreQuery.new())[/code]
# [code]yield(query_task, "task_finished")[/code]
# Since the emitted signal is holding an argument, it can be directly retrieved as a return variable from the [code]yield()[/code] function.
#
# ex.
# [code]var result : Array = yield(query_task, "task_finished")[/code]
#
# [b]Warning:[/b] It currently does not work offline!
#
# @args query
# @arg-types FirestoreQuery
# @return FirestoreTask

### list

```gdscript
func list(path: String = "", page_size: int = 0, page_token: String = "", order_by: String = "") -> FirestoreTask
```

# Request a list of contents (documents and/or collections) inside a collection, specified by its [i]id[/i]. This method will return a [code]FirestoreTask[/code] object, representing a reference to the request issued. If saved into a variable, the [code]FirestoreTask[/code] object can be used to yield on the [code]result_query(result)[/code] signal, or the more generic [code]task_finished(result)[/code] signal.
# [b]Note:[/b] [code]order_by[/code] does not work in offline mode.
# ex.
# [code]var query_task : FirestoreTask = Firebase.Firestore.query(FirestoreQuery.new())[/code]
# [code]yield(query_task, "task_finished")[/code]
# Since the emitted signal is holding an argument, it can be directly retrieved as a return variable from the [code]yield()[/code] function.
#
# ex.
# [code]var result : Array = yield(query_task, "task_finished")[/code]
#
# @args collection_id, page_size, page_token, order_by
# @arg-types String, int, String, String
# @arg-defaults , 0, "", ""
# @return FirestoreTask

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

- signal listed_documents(documents): # Emitted when a  [code]list()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
- signal result_query(result): # Emitted when a  [code]list()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a  [code]query()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
- signal task_error(code, status, message): # Emitted when a  [code]list()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a  [code]query()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a  [code]query()[/code] request is successfully completed. [code]error()[/code] signal will be emitted otherwise.
# @arg-types Array
# Emitted when a [code]list()[/code] or [code]query()[/code] request is [b]not[/b] successfully completed.

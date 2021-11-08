<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirestoreCollection

**Extends:** [Reference](../Reference)

## Description

# @meta-authors TODO
# @meta-authors TODO
# @meta-version 2.3
# A reference to a Firestore Collection.
# Documentation TODO.

## Property Descriptions

### auth

```gdscript
var auth: Dictionary
```

### collection\_name

```gdscript
var collection_name: String
```

### firestore

```gdscript
var firestore
```

FirebaseFirestore (can't static type due to cyclic reference)

## Method Descriptions

### get

```gdscript
func get(document_id: String) -> FirestoreTask
```

----------------------- Requests
# @args document_id
# @return FirestoreTask
# used to GET a document from the collection, specify @document_id

### add

```gdscript
func add(document_id: String, fields: Dictionary) -> FirestoreTask
```

# @args document_id, fields
# @arg-defaults , {}
# @return FirestoreTask
# used to SAVE/ADD a new document to the collection, specify @documentID and @fields

### update

```gdscript
func update(document_id: String, fields: Dictionary) -> FirestoreTask
```

# @args document_id, fields
# @arg-defaults , {}
# @return FirestoreTask
used to UPDATE a document, specify @documentID and @fields

### delete

```gdscript
func delete(document_id: String) -> FirestoreTask
```

# @args document_id
# @return FirestoreTask
used to DELETE a document, specify @document_id

## Signals

- signal add_document(doc): 
- signal get_document(doc): 
- signal update_document(doc): 
- signal delete_document(): 
- signal error(code, status, message): 

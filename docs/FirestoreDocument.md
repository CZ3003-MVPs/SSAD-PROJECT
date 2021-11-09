<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirestoreDocument

**Extends:** [Reference](../Reference)

## Description

# @meta-authors TODO
# @meta-version 2.2
# A reference to a Firestore Document.
# Documentation TODO.

## Property Descriptions

### document

```gdscript
var document: Dictionary
```

A FirestoreDocument objects that holds all important values for a Firestore Document,
@doc_name = name of the Firestore Document, which is the request PATH
@doc_fields = fields held by Firestore Document, in APIs format
created when requested from a `collection().get()` call
the Document itself

### doc\_fields

```gdscript
var doc_fields: Dictionary
```

only .fields

### doc\_name

```gdscript
var doc_name: String
```

only .name

### create\_time

```gdscript
var create_time: String
```

createTime

## Method Descriptions

### \_init

```gdscript
func _init(doc: Dictionary, _doc_name: String = "", _doc_fields: Dictionary) -> void
```

### dict2fields <small>(static)</small>

```gdscript
func dict2fields(dict: Dictionary) -> Dictionary
```

Pass a dictionary { 'key' : 'value' } to format it in a APIs usable .fields

### fields2dict <small>(static)</small>

```gdscript
func fields2dict(doc: Dictionary) -> Dictionary
```

Pass the .fields inside a Firestore Document to print out the Dictionary { 'key' : 'value' }

### array2fields <small>(static)</small>

```gdscript
func array2fields(array: Array) -> Array
```

Pass an Array to parse it to a Firebase arrayValue

### fields2array <small>(static)</small>

```gdscript
func fields2array(array: Dictionary) -> Array
```

Pass a Firebase arrayValue Dictionary to convert it back to an Array

### dict2timestamp <small>(static)</small>

```gdscript
func dict2timestamp(dict: Dictionary) -> String
```

Converts a gdscript Dictionary (most likely obtained with OS.get_datetime()) to a Firebase Timestamp

### timestamp2dict <small>(static)</small>

```gdscript
func timestamp2dict(timestamp: String) -> Dictionary
```

Converts a Firebase Timestamp back to a gdscript Dictionary

### is\_field\_timestamp <small>(static)</small>

```gdscript
func is_field_timestamp(field: Dictionary) -> bool
```


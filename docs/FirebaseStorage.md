<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseStorage

**Extends:** [Node](../Node)

## Description

# @meta-authors SIsilicon
# @meta-version 2.2
# The Storage API for Firebase.
# This object handles all firebase storage tasks, variables and references. To use this API, you must first create a [StorageReference](StorageReference). With the reference, you can then query and manipulate the file or folder in the cloud storage.
#
# [i]Note: In HTML builds, you must configure [url=https://firebase.google.com/docs/storage/web/download-files#cors_configuration]CORS[/url] in your storage bucket.[i]

## Property Descriptions

### bucket

```gdscript
var bucket: String
```

# The current storage bucket the Storage API is referencing.

### requesting

```gdscript
var requesting: bool = false
```

# @default false
# Whether a task is currently being processed.

## Method Descriptions

### ref

```gdscript
func ref(path: String = "") -> StorageReference
```

# @args path
# @arg-defaults ""
# @return StorageReference
# Returns a reference to a file or folder in the storage bucket. It's this reference that should be used to control the file/folder on the server end.

## Signals

- signal task_successful(result, response_code, data): # @arg-types int, int, PoolStringArray
# @arg-enums HTTPRequest.Result, HTTPClient.ResponseCode
# Emitted when a [StorageTask](StorageTask) has finished successful.
- signal task_failed(result, response_code, data): # @arg-types int, int, PoolStringArray
# @arg-enums HTTPRequest.Result, HTTPClient.ResponseCode
# Emitted when a [StorageTask](StorageTask) has finished with an error.

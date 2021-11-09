<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StorageReference

**Extends:** [Reference](../Reference)

## Description

# @meta-authors SIsilicon
# @meta-version 2.2
# A reference to a file or folder in the Firebase cloud storage.
# This object is used to interact with the cloud storage. You may get data from the server, as well as upload your own back to it.

## Constants Descriptions

### DEFAULT\_MIME\_TYPE

```gdscript
const DEFAULT_MIME_TYPE: String = "application/octet-stream"
```

# The default MIME type to use when uploading a file.
# Data sent with this type are interpreted as plain binary data. Note that firebase will generate an MIME type based on the file extenstion if none is provided.

### MIME\_TYPES

```gdscript
const MIME_TYPES: Dictionary = {"bmp":"image/bmp","css":"text/css","csv":"text/csv","gd":"text/plain","htm":"text/html","html":"text/html","jpeg":"image/jpeg","jpg":"image/jpeg","json":"application/json","mp3":"audio/mpeg","mpeg":"video/mpeg","ogg":"audio/ogg","ogv":"video/ogg","png":"image/png","shader":"text/plain","svg":"image/svg+xml","tif":"image/tiff","tiff":"image/tiff","tres":"text/plain","tscn":"text/plain","txt":"text/plain","wav":"audio/wav","webm":"video/webm","webp":"video/webm","xml":"text/xml"}
```

# A dictionary of common MIME types based on a file extension.
# Example: [code]MIME_TYPES.png[/code] will return [code]image/png[/code].

## Property Descriptions

### bucket

```gdscript
var bucket: String = ""
```

# @default ""
# The stroage bucket this referenced file/folder is located in.

### full\_path

```gdscript
var full_path: String = ""
```

# @default ""
# The path to the file/folder relative to [member bucket].

### name

```gdscript
var name: String = ""
```

# @default ""
# The name of the file/folder, including any file extension.
# Example: If the [member full_path] is [code]images/user/image.png[/code], then the [member name] would be [code]image.png[/code].

### parent

```gdscript
var parent: StorageReference
```

# The parent [StorageReference](StorageReference) one level up the file hierarchy.
# If the current [StorageReference](StorageReference).

### root

```gdscript
var root: StorageReference
```

# The root [StorageReference](StorageReference).

### storage

```gdscript
var storage
```

# @type FirebaseStorage
# The Storage API that created this [StorageReference](StorageReference) to begin with.
FirebaseStorage (Can't static type due to cyclic reference)

### valid

```gdscript
var valid: bool = false
```

# @default false
# Whether this [StorageReference](StorageReference) is valid. None of the functions will work when in an invalid state.
# It is set to false when [method delete] is called.

## Method Descriptions

### child

```gdscript
func child(path: String) -> StorageReference
```

# @args path
# @return StorageReference
# Returns a reference to another [StorageReference](StorageReference) relative to this one.

### put\_data

```gdscript
func put_data(data: PoolByteArray, metadata: Dictionary) -> StorageTask
```

# @args data, metadata
# @return StorageTask
# Makes an attempt to upload data to the referenced file location. Status on this task is found in the returned [StorageTask](StorageTask).

### put\_string

```gdscript
func put_string(data: String, metadata: Dictionary) -> StorageTask
```

# @args data, metadata
# @return StorageTask
# Like [method put_data], but [code]data[/code] is a [String].

### put\_file

```gdscript
func put_file(file_path: String, metadata: Dictionary) -> StorageTask
```

# @args file_path, metadata
# @return StorageTask
# Like [method put_data], but the data comes from a file at [code]file_path[/code].

### get\_data

```gdscript
func get_data() -> StorageTask
```

# @return StorageTask
# Makes an attempt to download the files from the referenced file location. Status on this task is found in the returned [StorageTask](StorageTask).

### get\_string

```gdscript
func get_string() -> StorageTask
```

# @return StorageTask
# Like [method get_data], but the data in the returned [StorageTask] comes in the form of a [String].

### get\_download\_url

```gdscript
func get_download_url() -> StorageTask
```

# @return StorageTask
# Attempts to get the download url that points to the referenced file's data. Using the url directly may require an authentication header. Status on this task is found in the returned [StorageTask](StorageTask).

### get\_metadata

```gdscript
func get_metadata() -> StorageTask
```

# @return StorageTask
# Attempts to get the metadata of the referenced file. Status on this task is found in the returned [StorageTask](StorageTask).

### update\_metadata

```gdscript
func update_metadata(metadata: Dictionary) -> StorageTask
```

# @args metadata
# @return StorageTask
# Attempts to update the metadata of the referenced file. Any field with a value of [code]null[/code] will be deleted on the server end. Status on this task is found in the returned [StorageTask].

### list

```gdscript
func list() -> StorageTask
```

# @return StorageTask
# Attempts to get the list of files and/or folders under the referenced folder This function is not nested unlike [method list_all]. Status on this task is found in the returned [StorageTask].

### list\_all

```gdscript
func list_all() -> StorageTask
```

# @return StorageTask
# Attempts to get the list of files and/or folders under the referenced folder This function is nested unlike [method list]. Status on this task is found in the returned [StorageTask].

### delete

```gdscript
func delete() -> StorageTask
```

# @return StorageTask
# Attempts to delete the referenced file/folder. If successful, the reference will become invalid And can no longer be used. If you need to reference this location again, make a new reference with [method StorageTask.ref]. Status on this task is found in the returned [StorageTask].
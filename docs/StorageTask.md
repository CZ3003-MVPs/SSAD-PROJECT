<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StorageTask

**Extends:** [Reference](../Reference)

## Description

# @meta-authors SIsilicon
# @meta-version 2.2
# An object that keeps track of an operation performed by [StorageReference](StorageReference).

## Enumerations

### Task

```gdscript
const Task: Dictionary = {"TASK_DELETE":7,"TASK_DOWNLOAD":2,"TASK_DOWNLOAD_META":3,"TASK_DOWNLOAD_URL":4,"TASK_LIST":5,"TASK_LIST_ALL":6,"TASK_MAX":8,"TASK_UPLOAD":0,"TASK_UPLOAD_META":1}
```

## Property Descriptions

### ref

```gdscript
var ref
```

# @type StorageReference
# The [StorageReference](StorageReference).
Storage Reference (Can't static type due to cyclic reference)

### action

```gdscript
var action: int = -1
```

- **Setter**: `set_action`

# @enum Task
# @default -1
# @setter set_action
# The kind of operation this [StorageTask](StorageTask) is keeping track of.

### data

```gdscript
var data
```

# @default PoolByteArray()
# Data that the tracked task will/has returned.
data can be of any type.

### progress

```gdscript
var progress: float = 0
```

# @default 0.0
# The percentage of data that has been received.

### result

```gdscript
var result: int = -1
```

# @default -1
# @enum HTTPRequest.Result
# The resulting status of the task. Anyting other than [constant HTTPRequest.RESULT_SUCCESS] means an error has occured.

### finished

```gdscript
var finished: bool = false
```

# @default false
# Whether the task is finished processing.

### response\_headers

```gdscript
var response_headers: PoolStringArray
```

# @default PoolStringArray()
# The returned HTTP response headers.

### response\_code

```gdscript
var response_code: int = 0
```

# @default 0
# @enum HTTPClient.ResponseCode
# The returned HTTP response code.

## Method Descriptions

### set\_action

```gdscript
func set_action(value: int) -> void
```

## Signals

- signal task_finished(data): # Emitted when the task is finished. Returns data depending on the success and action of the task.

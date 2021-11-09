<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# test\_FirebaseDatabaseStore.gd

## Constants Descriptions

### FirebaseDatabaseStore

```gdscript
const FirebaseDatabaseStore: FirebaseDatabaseStore = preload("res://addons/godot-firebase/database/database_store.gd")
```

# @meta-authors TODO
# @meta-version 2.2
# Data structure that holds the currently-known data at a given path (a.k.a. reference) in a Firebase Realtime Database.
# Can process both puts and patches into the data based on realtime events received from the service.

### TestArray

```gdscript
const TestArray: Array = [666,777,888,999]
```

### TestKey

```gdscript
const TestKey: String = "-MPrgu_F8OXiL-VpRxjq"
```

### TestObject

```gdscript
const TestObject: Dictionary = {"I":"Some Value","II":"Some Other Value","III":[111,222,333,444,555],"IV":{"a":"Another Value","b":"Yet Another Value"}}
```

### TestObjectOther

```gdscript
const TestObjectOther: Dictionary = {"a":"A Different Value","b":"Another One","c":"A New Value"}
```

### TestValue

```gdscript
const TestValue: float = 12345.6789
```

## Sub\-classes

### TestPutOperations

#### Method Descriptions

### test\_put\_object

```gdscript
func test_put_object()
```

### test\_put\_nested\_object

```gdscript
func test_put_nested_object()
```

### test\_put\_array\_value

```gdscript
func test_put_array_value()
```

### test\_put\_normal\_value

```gdscript
func test_put_normal_value()
```

### test\_put\_deleted\_value

```gdscript
func test_put_deleted_value()
```

### test\_put\_new\_object

```gdscript
func test_put_new_object()
```

### test\_put\_new\_nested\_object

```gdscript
func test_put_new_nested_object()
```

### test\_put\_new\_array\_value

```gdscript
func test_put_new_array_value()
```

### test\_put\_new\_normal\_value

```gdscript
func test_put_new_normal_value()
```

### TestPatchOperations

#### Method Descriptions

### test\_patch\_object

```gdscript
func test_patch_object()
```

### test\_patch\_nested\_object

```gdscript
func test_patch_nested_object()
```

### test\_patch\_array\_value

```gdscript
func test_patch_array_value()
```

### test\_patch\_normal\_value

```gdscript
func test_patch_normal_value()
```

### test\_patch\_deleted\_value

```gdscript
func test_patch_deleted_value()
```


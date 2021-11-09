<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# firebase.gd

**Extends:** [Node](../Node)

## Description

# @meta-authors Kyle Szklenski
# @meta-version 2.5
# The Firebase Godot API.
# This singleton gives you access to your Firebase project and its capabilities. Using this requires you to fill out some Firebase configuration settings. It currently comes with four modules.
# 	- [code]Auth[/code]: Manages user authentication (logging and out, etc...)
# 	- [code]Database[/code]: A NonSQL realtime database for managing data in JSON structures.
# 	- [code]Firestore[/code]: Similar to Database, but stores data in collections and documents, among other things.
# 	- [code]Storage[/code]: Gives access to Cloud Storage; perfect for storing files like images and other assets.
#
# @tutorial https://github.com/GodotNuts/GodotFirebase/wiki

## Property Descriptions

### Auth

```gdscript
var Auth: FirebaseAuth
```

# @type FirebaseAuth
# The Firebase Authentication API.

### Firestore

```gdscript
var Firestore: FirebaseFirestore
```

# @type FirebaseFirestore
# The Firebase Firestore API.

### Database

```gdscript
var Database: FirebaseDatabase
```

# @type FirebaseDatabase
# The Firebase Realtime Database API.

### Storage

```gdscript
var Storage: FirebaseStorage
```

# @type FirebaseStorage
# The Firebase Storage API.

### DynamicLinks

```gdscript
var DynamicLinks: FirebaseDynamicLinks
```

# @type FirebaseDynamicLinks
# The Firebase Dynamic Links API.

### Functions

```gdscript
var Functions: FirebaseFunctions
```

# @type FirebaseFunctions
# The Firebase Cloud Functions API

### emulating

```gdscript
export var emulating: bool = false
```

## Method Descriptions

### set\_emulated

```gdscript
func set_emulated(emulating: bool = true) -> void
```


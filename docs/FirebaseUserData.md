<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseUserData

**Extends:** [Reference](../Reference)

## Description

# @meta-authors TODO
# @meta-version 2.3
# Authentication user data.
# Documentation TODO.

## Property Descriptions

### local\_id

```gdscript
var local_id: String = ""
```

The uid of the current user.

### email

```gdscript
var email: String = ""
```

### email\_verified

```gdscript
var email_verified: bool
```

Whether or not the account's email has been verified.

### password\_updated\_at

```gdscript
var password_updated_at: float = 0
```

The timestamp, in milliseconds, that the account password was last changed.

### last\_login\_at

```gdscript
var last_login_at: float = 0
```

The timestamp, in milliseconds, that the account last logged in at.

### created\_at

```gdscript
var created_at: float = 0
```

The timestamp, in milliseconds, that the account was created at.

### provider\_user\_info

```gdscript
var provider_user_info: Array
```

### provider\_id

```gdscript
var provider_id: String = ""
```

### display\_name

```gdscript
var display_name: String = ""
```

### photo\_url

```gdscript
var photo_url: String = ""
```

## Method Descriptions

### \_init

```gdscript
func _init(p_userdata: Dictionary) -> void
```

### as\_text

```gdscript
func as_text() -> String
```


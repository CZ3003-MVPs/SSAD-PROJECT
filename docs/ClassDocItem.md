<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ClassDocItem

**Extends:** [DocItem](../DocItem) < [Reference](../Reference)

## Description

# An object that contains documentation data about a class.
# @contribute https://placeholder_contribute.com

## Property Descriptions

### base

```gdscript
var base: String
```

# The base class this class extends from.

### path

```gdscript
var path: String
```

# The file location of this class' script.

### brief

```gdscript
var brief: String
```

# A brief description of the class.

### description

```gdscript
var description: String
```

# A full description of the class.

### methods

```gdscript
var methods: Array
```

# A list of method documents.

### properties

```gdscript
var properties: Array
```

# A list of property documents.

### signals

```gdscript
var signals: Array
```

# A list of signal documents.

### constants

```gdscript
var constants: Array
```

# A list of constant documents, including enumerators.

### tutorials

```gdscript
var tutorials: Array
```

# A list of tutorials that helps to understand this class.

### contriute\_url

```gdscript
var contriute_url: String
```

# @default ""
# A link to where the user can contribute to the class' documentation.

### is\_singleton

```gdscript
var is_singleton: bool
```

# @default false
# Whether the class is a singleton.

### icon

```gdscript
var icon: String
```

# @default false
# Whether the class is a singleton.
# A path to the class icon if any.

## Method Descriptions

### \_init

```gdscript
func _init(args: Dictionary) -> void
```

### get\_method\_doc

```gdscript
func get_method_doc(name: String) -> MethodDocItem
```

# @args name
# @return MethodDocItem
# Gets a method document called [code]name[/code].

### get\_property\_doc

```gdscript
func get_property_doc(name: String) -> PropertyDocItem
```

# @args name
# @return PropertyDocItem
# Gets a signal document called [code]name[/code].

### get\_signal\_doc

```gdscript
func get_signal_doc(name: String) -> SignalDocItem
```

# @args name
# @return SignalDocItem
# Gets a signal document called [code]name[/code].

### get\_constant\_doc

```gdscript
func get_constant_doc(name: String) -> ConstantDocItem
```

# @args name
# @return ConstantlDocItem
# Gets a signal document called [code]name[/code].
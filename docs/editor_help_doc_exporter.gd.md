<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# editor\_help\_doc\_exporter.gd

**Extends:** [DocExporter](../DocExporter) < [Reference](../Reference)

## Description

## Property Descriptions

### plugin

```gdscript
var plugin: EditorPlugin
```

### label

```gdscript
var label: RichTextLabel
```

### class\_docs

```gdscript
var class_docs: Dictionary
```

### editor\_settings

```gdscript
var editor_settings: EditorSettings
```

### theme

```gdscript
var theme: Theme
```

### class\_list

```gdscript
var class_list: Array
```

### section\_lines

```gdscript
var section_lines: Array
```

### description\_line

```gdscript
var description_line: int
```

### signal\_line

```gdscript
var signal_line: Dictionary
```

### method\_line

```gdscript
var method_line: Dictionary
```

### property\_line

```gdscript
var property_line: Dictionary
```

### enum\_line

```gdscript
var enum_line: Dictionary
```

### constant\_line

```gdscript
var constant_line: Dictionary
```

### doc\_font

```gdscript
var doc_font: Font
```

### doc\_bold\_font

```gdscript
var doc_bold_font: Font
```

### doc\_title\_font

```gdscript
var doc_title_font: Font
```

### doc\_code\_font

```gdscript
var doc_code_font: Font
```

### title\_color

```gdscript
var title_color: Color
```

### text\_color

```gdscript
var text_color: Color
```

### headline\_color

```gdscript
var headline_color: Color
```

### base\_type\_color

```gdscript
var base_type_color: Color
```

### comment\_color

```gdscript
var comment_color: Color
```

### symbol\_color

```gdscript
var symbol_color: Color
```

### value\_color

```gdscript
var value_color: Color
```

### qualifier\_color

```gdscript
var qualifier_color: Color
```

### type\_color

```gdscript
var type_color: Color
```

## Method Descriptions

### update\_theme\_vars

```gdscript
func update_theme_vars() -> void
```

### add\_type

```gdscript
func add_type(type: String, _enum: String)
```

### add\_method

```gdscript
func add_method(method: MethodDocItem, overview: bool) -> void
```

### add\_text

```gdscript
func add_text(bbcode: String) -> void
```

### sort\_methods

```gdscript
func sort_methods(a: Dictionary, b: Dictionary) -> bool
```


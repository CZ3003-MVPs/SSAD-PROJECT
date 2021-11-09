<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirestoreQuery

**Extends:** [Reference](../Reference)

## Description

# @meta-authors Nicoló 'fenix' Santilio
# @meta-version 1.3
# A firestore query.
# Documentation TODO.

## Enumerations

### DIRECTION

```gdscript
const DIRECTION: Dictionary = {"ASCENDING":1,"DESCENDING":2,"DIRECTION_UNSPECIFIED":0}
```

### OPERATOR

```gdscript
const OPERATOR: Dictionary = {"AND":15,"ARRAY_CONTAINS":7,"ARRAY_CONTAINS_ANY":8,"EQUAL":5,"GREATER_THAN":3,"GREATER_THAN_OR_EQUAL":4,"IN":9,"IS_NAN":11,"IS_NOT_NAN":13,"IS_NOT_NULL":14,"IS_NULL":12,"LESS_THAN":1,"LESS_THAN_OR_EQUAL":2,"NOT_EQUAL":6,"NOT_IN":10,"OPERATOR_NSPECIFIED":0,"OR":16}
```

## Constants Descriptions

### TEMPLATE\_QUERY

```gdscript
const TEMPLATE_QUERY: Dictionary = {"endAt":{},"from":[],"limit":0,"offset":0,"orderBy":[],"select":{},"startAt":{},"where":{}}
```

## Property Descriptions

### query

```gdscript
var query: Dictionary
```

## Method Descriptions

### select

```gdscript
func select(fields) -> FirestoreQuery
```

Select which fields you want to return as a reflection from your query.
Fields must be added inside a list. Only a field is accepted inside the list
Leave the Array empty if you want to return the whole document

### from

```gdscript
func from(collection_id: String, all_descendants: bool = true) -> FirestoreQuery
```

Select the collection you want to return the query result from
if @all_descendants also sub-collections will be returned. If false, only documents will be returned

### from\_many

```gdscript
func from_many(collections_array: Array) -> FirestoreQuery
```

@collections_array MUST be an Array of Arrays with this structure
[ ["collection_id", true/false] ]

### where

```gdscript
func where(field: String, operator: int, value = null, chain: int = -1)
```

Query the value of a field you want to match
@field : the name of the field
@operator : from FirestoreQuery.OPERATOR
@value : can be any type - String, int, bool, float
@chain : from FirestoreQuery.OPERATOR.[OR/AND], use it only if you want to chain "AND" or "OR" logic with futher where_field() calls
eg. .where_field("name", OPERATOR.EQUAL, "Matt", OPERATOR.AND).where_field("age", OPERATOR.LESS_THAN, 20)

### order\_by

```gdscript
func order_by(field: String, direction: int) -> FirestoreQuery
```

Order by a field, defining its name and the order direction
default directoin = Ascending

### order\_by\_fields

```gdscript
func order_by_fields(order_field_list: Array) -> FirestoreQuery
```

Order by a set of fields and directions
@order_list is an Array of Arrays with the following structure
[@field_name , @DIRECTION.[direction]]
else, order_object() can be called to return an already parsed Dictionary

### start\_at

```gdscript
func start_at(value, before: bool) -> FirestoreQuery
```

### end\_at

```gdscript
func end_at(value, before: bool) -> FirestoreQuery
```

### offset

```gdscript
func offset(offset: int) -> FirestoreQuery
```

### limit

```gdscript
func limit(limit: int) -> FirestoreQuery
```

### create\_field\_filter

```gdscript
func create_field_filter(field: String, operator: int, value) -> Dictionary
```

### create\_unary\_filter

```gdscript
func create_unary_filter(field: String, operator: int) -> Dictionary
```

### create\_composite\_filter

```gdscript
func create_composite_filter(operator: int, filters: Array) -> Dictionary
```

### clean

```gdscript
func clean() -> void
```

## Signals

- signal query_result(query_result): 

## Sub\-classes

### Order

#### Property Descriptions

### obj

```gdscript
var obj: Dictionary
```

### Cursor

#### Property Descriptions

### values

```gdscript
var values: Array
```

### before

```gdscript
var before: bool
```

#### Method Descriptions

### \_init

```gdscript
func _init(v: Array, b: bool)
```


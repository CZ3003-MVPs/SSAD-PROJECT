<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Backend.gd

**Extends:** [Node](../Node)

## Description

## Property Descriptions

### user\_info

```gdscript
var user_info: Dictionary
```

User information

### level

```gdscript
var level
```

User information

## Method Descriptions

### set\_user\_info

```gdscript
func set_user_info(result)
```

Sets user's information on client from the database

### clear\_user\_info

```gdscript
func clear_user_info()
```

Clears user's information on client

### upload\_level

```gdscript
func upload_level(file_path)
```

Uploads level (Upcoming feature)

### get\_sprites

```gdscript
func get_sprites()
```

Gets Sprites (Upcoming feature)

### upload\_sprite

```gdscript
func upload_sprite(file_path)
```

Uploads Sprites (Upcoming feature)

### create\_document

```gdscript
func create_document(result, username)
```

Creates document on database after registration

### get\_statistics

```gdscript
func get_statistics()
```

Gets statistics for teacher

### get\_leaderboard

```gdscript
func get_leaderboard(score_field)
```

Gets leaderboard for viewing

### upload\_statistics

```gdscript
func upload_statistics(level_statistics)
```

Uploads new statistics

### get\_max\_level

```gdscript
func get_max_level()
```

Gets unlocked level

### change\_display\_name

```gdscript
func change_display_name(username)
```

Changes display name

### get\_display\_name

```gdscript
func get_display_name()
```

Gets display name

### get\_levels

```gdscript
func get_levels()
```

Gets levels

## Signals

- signal show_leaderboard(): 
- signal unlocked_levels(): 
- signal display_username(): 
- signal levels_list(): 
- signal teacher_statistics(): 

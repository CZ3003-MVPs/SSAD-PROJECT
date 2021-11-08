<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# HTTPSSEClient.gd

**Extends:** [Node](../Node)

## Description

## Constants Descriptions

### continue\_internal

```gdscript
const continue_internal: String = "continue_internal"
```

### data\_tag

```gdscript
const data_tag: String = "data:"
```

### event\_tag

```gdscript
const event_tag: String = "event:"
```

## Property Descriptions

### httpclient

```gdscript
var httpclient
```

### is\_connected

```gdscript
var is_connected
```

### domain

```gdscript
var domain
```

### url\_after\_domain

```gdscript
var url_after_domain
```

### port

```gdscript
var port
```

### use\_ssl

```gdscript
var use_ssl
```

### verify\_host

```gdscript
var verify_host
```

### told\_to\_connect

```gdscript
var told_to_connect
```

### connection\_in\_progress

```gdscript
var connection_in_progress
```

### request\_in\_progress

```gdscript
var request_in_progress
```

### is\_requested

```gdscript
var is_requested
```

### response\_body

```gdscript
var response_body
```

## Method Descriptions

### connect\_to\_host

```gdscript
func connect_to_host(domain: String, url_after_domain: String, port: int = -1, use_ssl: bool = false, verify_host: bool = true)
```

### attempt\_to\_connect

```gdscript
func attempt_to_connect()
```

### attempt\_to\_request

```gdscript
func attempt_to_request(httpclient_status)
```

### get\_event\_data

```gdscript
func get_event_data(body: String) -> Dictionary
```

## Signals

- signal new_sse_event(headers, event, data): 
- signal connected(): 
- signal connection_error(error): 

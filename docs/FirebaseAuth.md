<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# FirebaseAuth

**Extends:** [HTTPRequest](../HTTPRequest)

## Description

# @meta-authors TODO
# @meta-version 2.5
# The authentication API for Firebase.
# Documentation TODO.

## Enumerations

### Requests

```gdscript
const Requests: Dictionary = {"EXCHANGE_TOKEN":0,"LOGIN_WITH_OAUTH":1,"NONE":-1}
```

### Auth\_Type

```gdscript
const Auth_Type: Dictionary = {"LOGIN_ANON":1,"LOGIN_CT":2,"LOGIN_EP":0,"LOGIN_OAUTH":3,"NONE":-1,"SIGNUP_EP":4}
```

## Constants Descriptions

### RESPONSE\_ASSERTION

```gdscript
const RESPONSE_ASSERTION: String = "identitytoolkit#VerifyAssertionResponse"
```

VerifyAssertionResponse"

### RESPONSE\_CUSTOM\_TOKEN

```gdscript
const RESPONSE_CUSTOM_TOKEN: String = "identitytoolkit#VerifyCustomTokenResponse"
```

VerifyCustomTokenResponse"

### RESPONSE\_SIGNIN

```gdscript
const RESPONSE_SIGNIN: String = "identitytoolkit#VerifyPasswordResponse"
```

VerifyPasswordResponse"

### RESPONSE\_SIGNUP

```gdscript
const RESPONSE_SIGNUP: String = "identitytoolkit#SignupNewUserResponse"
```

SignupNewUserResponse"

### RESPONSE\_USERDATA

```gdscript
const RESPONSE_USERDATA: String = "identitytoolkit#GetAccountInfoResponse"
```

GetAccountInfoResponse"

## Property Descriptions

### auth

```gdscript
var auth: Dictionary
```

### is\_busy

```gdscript
var is_busy: bool = false
```

### tcp\_server

```gdscript
var tcp_server: TCP_Server
```

### tcp\_timer

```gdscript
var tcp_timer: Timer
```

### tcp\_timeout

```gdscript
var tcp_timeout: float = 0.5
```

### requesting

```gdscript
var requesting: int = -1
```

### auth\_request\_type

```gdscript
var auth_request_type: int = -1
```

## Method Descriptions

### is\_logged\_in

```gdscript
func is_logged_in() -> bool
```

Synchronous call to check if any user is already logged in.

### signup\_with\_email\_and\_password

```gdscript
func signup_with_email_and_password(email: String, password: String) -> void
```

Called with Firebase.Auth.signup_with_email_and_password(email, password)
You must pass in the email and password to this function for it to work correctly

### login\_anonymous

```gdscript
func login_anonymous() -> void
```

Called with Firebase.Auth.anonymous_login()
A successful request is indicated by a 200 OK HTTP status code.
The response contains the Firebase ID token and refresh token associated with the anonymous user.
The 'mail' field will be empty since no email is linked to an anonymous user

### login\_with\_email\_and\_password

```gdscript
func login_with_email_and_password(email: String, password: String) -> void
```

Called with Firebase.Auth.login_with_email_and_password(email, password)
You must pass in the email and password to this function for it to work correctly
If the login fails it will return an error code through the function _on_FirebaseAuth_request_completed

### login\_with\_custom\_token

```gdscript
func login_with_custom_token(token: String) -> void
```

Login with a custom valid token
The token needs to be generated using an external service/function

### get\_google\_auth

```gdscript
func get_google_auth(redirect_uri: String = "urn:ietf:wg:oauth:2.0:oob", client_id: String) -> void
```

Open a web page in browser redirecting to Google oAuth2 page for the current project
Once given user's authorization, a token will be generated.
NOTE** with this method, the authorization process will be copy-pasted

### get\_google\_auth\_manual

```gdscript
func get_google_auth_manual() -> void
```

### exchange\_google\_token

```gdscript
func exchange_google_token(google_token: String, redirect_uri: String = "urn:ietf:wg:oauth:2.0:oob") -> void
```

Exchange the authorization oAuth2 code obtained from browser with a proper access id_token

### get\_google\_auth\_redirect

```gdscript
func get_google_auth_redirect(redirect_uri: String, listen_to_port: int) -> var
```

### get\_google\_auth\_localhost

```gdscript
func get_google_auth_localhost(port: int = 49152)
```

Open a web page in browser redirecting to Google oAuth2 page for the current project
Once given user's authorization, a token will be generated.
NOTE** the generated token will be automatically captured and a login request will be made if the token is correct

### login\_with\_oauth

```gdscript
func login_with_oauth(_google_token: String, request_uri: String = "urn:ietf:wg:oauth:2.0:oob", provider_id: String = "google.com") -> var
```

Login with Google oAuth2.
A token is automatically obtained using an authorization code using @get_google_auth()
@provider_id and @request_uri can be changed

### logout

```gdscript
func logout() -> void
```

Function used to logout of the system, this will also remove the local encrypted auth file if there is one

### manual\_token\_refresh

```gdscript
func manual_token_refresh(auth_data)
```

Function is called when requesting a manual token refresh

### save\_auth

```gdscript
func save_auth(auth: Dictionary) -> void
```

Function used to save the auth data provided by Firebase into an encrypted file
Note this does not work in HTML5 or UWP

### load\_auth

```gdscript
func load_auth() -> void
```

Function used to load the auth data file that has been stored locally
Note this does not work in HTML5 or UWP

### remove\_auth

```gdscript
func remove_auth() -> void
```

Function used to remove the local encrypted auth file

### check\_auth\_file

```gdscript
func check_auth_file() -> void
```

Function to check if there is an encrypted auth data file
If there is, the game will load it and refresh the token

### change\_user\_email

```gdscript
func change_user_email(email: String) -> void
```

Function used to change the email account for the currently logged in user

### change\_user\_password

```gdscript
func change_user_password(password: String) -> void
```

Function used to change the password for the currently logged in user

### update\_account

```gdscript
func update_account(idToken: String, displayName: String, photoUrl: String, deleteAttribute: PoolStringArray, returnSecureToken: bool) -> void
```

User Profile handlers

### send\_account\_verification\_email

```gdscript
func send_account_verification_email() -> void
```

Function to send a account verification email

### send\_password\_reset\_email

```gdscript
func send_password_reset_email(email: String) -> void
```

Function used to reset the password for a user who has forgotten in.
This will send the users account an email with a password reset link

### get\_user\_data

```gdscript
func get_user_data() -> void
```

Function called to get all

### delete\_user\_account

```gdscript
func delete_user_account() -> void
```

Function used to delete the account of the currently authenticated user

### begin\_refresh\_countdown

```gdscript
func begin_refresh_countdown() -> var
```

Function is called when a new token is issued to a user. The function will yield until the token has expired, and then request a new one.

### get\_clean\_keys

```gdscript
func get_clean_keys(auth_result: Dictionary) -> Dictionary
```

This function is used to make all keys lowercase
This is only used to cut down on processing errors from Firebase
This is due to Google have inconsistencies in the API that we are trying to fix

## Signals

- signal auth_request(result_code, result_content): Emitted for each Auth request issued.
`result_code` -> Either `1` if auth succeeded or `error_code` if unsuccessful auth request
`result_content` -> Either `auth_result` if auth succeeded or `error_message` if unsuccessful auth request
- signal signup_succeeded(auth_result): 
- signal login_succeeded(auth_result): 
- signal login_failed(code, message): 
- signal signup_failed(code, message): 
- signal userdata_received(userdata): 
- signal token_exchanged(successful): 
- signal token_refresh_succeeded(auth_result): 
- signal logged_out(): 

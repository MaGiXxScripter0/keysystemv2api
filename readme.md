# Welcome to keyrblx's official documentation [UPDATED 2024]

⚠️ Warning : This library is complex and is not intended for new users, if you are new you should consider the basic security library


# How to setup the library ?
To setup the library you will need to load those two libraries :
```lua
local HashLibrary = loadstring(game.HttpGet("https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua"))()
local KeyLibrary = loadstring(game.HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/version2.lua"))()
```

Then please call the following function : 
```lua
KeyLibrary.Set({
ApplicationName = "app_name",
AuthType = "clientid",
EncryptionKey = "any data",
TrueData = "any data",
FalseData = "any data",
})
```
- ApplicationName : Your current application name, which can be found on your dashboard
  
- AuthType : The way to use to whitelist users, we recommand clientid but you can put ip
  
- EncryptionKey : This is the key that is going to be used to encrypt the validation result, everything is allowed put putting lowercase is better
  
- TrueData : This is the data that is going to get encrypted when the user is whitelisted
  
- FalseData : This is the data that is going to get encrypted when the user is not whitelisted

# How to use the library ?

To use the library and to validate users keys, you have to follow those steps :
1. Call the validate key function
```lua
local o_data = KeyLibrary.VerifyKey("keystring") or KeyLibrary.VerifyPremiumKey("keystring") or KeyLibrary.VerifyDefaultKey("keystring")
```
You can choose between those 3 functions :
- ValidateKey : Will validate all types of key
- ValidatePremiumKey : Will only validate premium keys
- ValidateDefaultKey : Will only validate defaults keys

2. Decrypt the data
```lua
local _,decrypted_data = KeyLibrary.XORDecode(o_data)
```
KeyLibrary.XORDecode is a function who decode an encrypted string.

3. Compare the decrypted data
```lua
local newhash = HashLibrary.sha1("YourTrueData")
if newhash == decrypted_data then
warn("Key is a valid key !")
else
warn("Key is non-valid !")
end
```
In this case, we use HashLibrary and we hash your true data

Then, we compare if the hashed data is equal to the decrypted data

If it's true, then the user key is valid, else its non valid **or** an encryption error. 

For more details we recommend you to use the false data for more precison :
```lua
local true = HashLibrary.sha1("YourTrueData")
local false = HashLibrary.sha1("YourFalseData")
if true == decrypted_data then
warn("Key is a valid key !")
else if false == decrypted_data then
warn("Key is non-valid !")
else
warn("decrypt error")
end
```

# Thanks for reading !
Please contact our developers for more informations !

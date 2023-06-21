# Key System v2.0

<img alt="Discord" src="https://img.shields.io/discord/1036258822811045931?label=Discord%20Server">
<img alt="GitHub last commit (branch)" src="https://img.shields.io/github/last-commit/MaGiXxScripter0/keysystemv2api/master">
<img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/MaGiXxScripter0/keysystemv2api">

---

### [**Discord Server**](https://discord.gg/9G46pAJFfR)

This is a free key system for monetizing your script in roblox.

The key system has:

- [x] Banner ads that you can install
- [ ] Premium Key
- [x] Basic Security

## How Use KeySystem in Lua

- [x] 1. Need connect library

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua"))()
```

- [x] 2. After connecting, you will have access to the storage

```lua
_G.KSS -- This Key System Storage

_G.KSS.classes = {
	key = KeyClass,
	keysystem = KeySystemClass
}

_G.KSS.data = {...}
```

### Docs:

```lua
type TKey = {
	hwid: string,
  key: string,
  time_expired: number,
  checkpoint: number,
  finish: boolean,
  last_visit: number
}

type TApplication = {
  name: string,
  created_at: string,
  website_settings: {
    title: string,
    description: string,
    image: string,
    icon: string,
    color: string,
    widget_id: string,
    analytics_google_code: string
  },
  checkpoints: number,
}
-- KeySystemClass
local Keysystem: KeySystemClass = _G.KSS.classes.keysystem.new(name: <string>)
Keysystem:getKeyURL() -> <string> -- Return URL for get key
Keysystem:copyGetKeyURL() -- Copy GetKeyURL
Keysystem:keyData() -> <table<TKey>> -- {...}
Keysystem:applicationData() -> table<TApplication> -- {...}
Keysystem:key() -> <table<KeyClass<TKey>>>

-- KeyClass
local Key = Keysystem:key() -> table<KeyClass<TKey>>
Key:verifyHWID() -> <boolean> -- Check HWID
Key:verifyKey(key: <string>) -> <boolean> -- Check Key

if Key.finish and Key:verifyHWID() and Key:verifyKey("keypupsik") then
	warn("Valid")
else
	warn("Invalid")
end
```

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua"))()
local KeySystem = _G.KSS.classes.keysystem.new("your_application_name") -- Create class KeySystem
local Key = KeySystem:key() -- Create class Key

warn(Key:verifyHWID(), Key:verifyKey("keypupsik"), Key.finish)
```

## Edit Code in VisualStudio

**Have basic typig**

```console
$ git clone https://github.com/MaGiXxScripter0/keysystemv2api.git

---> 100%
```

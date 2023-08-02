--[[ 
	KEY SYSTEM V2 UI LIBRARY:
			UI by mr.xrer | Code by mstudio45

    Script Example:
            local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/xrer_mstudio45.lua"))()
            KeySystemUI.New({
                ApplicationName = "", -- Your Key System
                Name = "", -- Your Script name
                Info = "", -- Info text in the GUI, keep empty for default text.
                DiscordInvite = "" -- Optional.
            })
            repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
            if KeySystemUI.Finished() and KeySystemUI.Closed == false then
                print("Key verified, can load script")
            else
                print("Player closed the GUI.")
            end
--]]

local KeySystemUI = { Closed = false }
local UIMade = false;

local UserInputService = game:GetService("UserInputService")
local CoreGUI = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request or HttpPost
local HIDEUI = get_hidden_gui or gethui
if syn and typeof(syn) == "table" and RenderWindow then
	syn.protect_gui = gethui;
end
local RemoveStringsInvite = {"discord.gg","discord.com/invite"}
local function JoinDiscord(DiscordInvite)
    if setclipboard then
        setclipboard(DiscordInvite)
    end
    if httprequest then
        for _,v in pairs(RemoveStringsInvite) do
            DiscordInvite = string.gsub(DiscordInvite, "https://", "")
            DiscordInvite = string.gsub(DiscordInvite, "http://", "")
            DiscordInvite = string.gsub(DiscordInvite, v.."/", "")
            DiscordInvite = string.gsub(DiscordInvite, v, "")
        end
        httprequest({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {
                    code = DiscordInvite
                },
                nonce = HttpService:GenerateGUID(false)
            }),
        })
    end
end
local function Validate(Values, options)
    for i,v in pairs(Values) do
        if options[i] == nil then
            options[i] = v
        end
    end

    return options
end
local function Hide_UI(gui)
	if HIDEUI then
		gui["Parent"] = HIDEUI()
	elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
		syn.protect_gui(gui)
		gui["Parent"] = CoreGUI
	elseif CoreGUI:FindFirstChild('RobloxGui') then
		gui["Parent"] = CoreGUI.RobloxGui
	else
		gui["Parent"] = CoreGUI
	end
end
local function MakeDraggable(gui)
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
	    local delta = input.Position - dragStart
	    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	gui.InputBegan:Connect(function(input)
	    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	        dragging = true
	        dragStart = input.Position
	        startPos = gui.Position
	        
	        input.Changed:Connect(function()
	            if input.UserInputState == Enum.UserInputState.End then
	                dragging = false
	            end
	        end)
	    end
	end)
	gui.InputChanged:Connect(function(input)
	    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	        dragInput = input
	    end
	end)
	 
	UserInputService.InputChanged:Connect(function(input)
	    if input == dragInput and dragging then
	        update(input)
	    end
	end)
end

-- Notify Lib by mr.xrer
-- License: https://api-sirclub.onrender.com/scripts/raw/license
local Notif = loadstring(game:HttpGet("https://api-sirclub.onrender.com/scripts/raw/notifybottom.lua"))()

-- Main Function
local function MakeUi(applicationName, name, info, discordInvite)
    if UIMade == true then return end
    UIMade = true

    local key_system = Instance.new("ScreenGui")
    key_system.IgnoreGuiInset = false
    key_system.ResetOnSpawn = true
    key_system.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    key_system.Name = "KeySystem"
    key_system.Parent = workspace
    Hide_UI(key_system)
    
    local canvas_group = Instance.new("CanvasGroup")
    canvas_group.AnchorPoint = Vector2.new(0.5, 0.5)
    canvas_group.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    canvas_group.BorderColor3 = Color3.new(0, 0, 0)
    canvas_group.BorderSizePixel = 0
    canvas_group.Position = UDim2.new(0.5, 0, 0.5, 0)
    canvas_group.Size = UDim2.new(0, 350, 0, 265)
    canvas_group.Visible = true
    canvas_group.Parent = key_system
    MakeDraggable(canvas_group)
    
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 5)
    uicorner.Parent = canvas_group
    
    local top_frame = Instance.new("Frame")
    top_frame.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
    top_frame.BorderColor3 = Color3.new(0.113725, 0.113725, 0.113725)
    top_frame.Size = UDim2.new(1, 0, 0, 40)
    top_frame.Visible = true
    top_frame.Name = "TopFrame"
    top_frame.Parent = canvas_group
    
    local close_btn = Instance.new("TextButton")
    close_btn.Font = Enum.Font.SourceSans
    close_btn.Text = ""
    close_btn.TextColor3 = Color3.new(0, 0, 0)
    close_btn.TextSize = 14
    close_btn.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
    close_btn.BorderColor3 = Color3.new(0, 0, 0)
    close_btn.BorderSizePixel = 0
    close_btn.Position = UDim2.new(0.942857146, -15, 0.107142858, 0)
    close_btn.Size = UDim2.new(0, 30, 0, 30)
    close_btn.Visible = true
    close_btn.ZIndex = 2
    close_btn.Name = "CloseBtn"
    close_btn.Parent = top_frame
    
    local uicorner_2 = Instance.new("UICorner")
    uicorner_2.CornerRadius = UDim.new(0, 5)
    uicorner_2.Parent = close_btn
    
    local clear = Instance.new("ImageButton")
    clear.Image = "rbxassetid://3926305904"
    clear.ImageColor3 = Color3.new(0.619608, 0.619608, 0.619608)
    clear.ImageRectOffset = Vector2.new(924, 724)
    clear.ImageRectSize = Vector2.new(36, 36)
    clear.ImageTransparency = 0.10000000149011612
    clear.AnchorPoint = Vector2.new(0.5, 0.5)
    clear.BackgroundTransparency = 1
    clear.LayoutOrder = 3
    clear.Position = UDim2.new(0.5, 0, 0.5, 0)
    clear.Size = UDim2.new(0, 20, 0, 20)
    clear.Visible = true
    clear.ZIndex = 2
    clear.Name = "clear"
    clear.Parent = close_btn
    
    local text_label = Instance.new("TextLabel")
    text_label.Font = Enum.Font.Gotham
    text_label.RichText = true
    text_label.Text = tostring(name).." - <b>Key System</b>"
    text_label.TextColor3 = Color3.new(0.862745, 0.862745, 0.862745)
    text_label.TextSize = 14
    text_label.BackgroundColor3 = Color3.new(1, 1, 1)
    text_label.BackgroundTransparency = 1
    text_label.BorderColor3 = Color3.new(0, 0, 0)
    text_label.BorderSizePixel = 0
    text_label.Size = UDim2.new(0, 350, 0, 40)
    text_label.Visible = true
    text_label.Parent = top_frame
    
    local text_label_2 = Instance.new("TextLabel")
    text_label_2.Font = Enum.Font.Gotham
    if info == "" then
        text_label_2.Text = "To use the free version of "..tostring(name).." you need a key. Click 'Get Key' button to get your key!"
    else
        text_label_2.Text = info == nil and "To use the free version of "..tostring(name).." you need a key. Click 'Get Key' button to get your key!" or tostring(info)
    end
    text_label_2.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
    text_label_2.TextSize = 14
    text_label_2.TextWrapped = true
    text_label_2.BackgroundColor3 = Color3.new(1, 1, 1)
    text_label_2.BackgroundTransparency = 1
    text_label_2.BorderColor3 = Color3.new(0, 0, 0)
    text_label_2.BorderSizePixel = 0
    text_label_2.Position = UDim2.new(0.034285713, 0, 0.143999994, 14)
    text_label_2.Size = UDim2.new(0, 325, 0, 49)
    text_label_2.Visible = true
    text_label_2.Parent = canvas_group
    
    local text_box = Instance.new("TextBox")
    text_box.CursorPosition = -1
    text_box.Font = Enum.Font.Gotham
    text_box.PlaceholderText = "Enter Key..."
    text_box.Text = ""
    text_box.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
    text_box.TextSize = 16
    text_box.TextTruncate = Enum.TextTruncate.AtEnd
    text_box.TextXAlignment = Enum.TextXAlignment.Left
    text_box.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
    text_box.BorderColor3 = Color3.new(0, 0, 0)
    text_box.BorderSizePixel = 0
    text_box.Position = UDim2.new(0.034285713, 0, 0.416000009, 5)
    text_box.Size = UDim2.new(0, 325, 0, 50)
    text_box.Visible = true
    text_box.ClearTextOnFocus = false
    text_box.Parent = canvas_group
    
    local uicorner_3 = Instance.new("UICorner")
    uicorner_3.CornerRadius = UDim.new(0, 4)
    uicorner_3.Parent = text_box
    
    local uipadding = Instance.new("UIPadding")
    uipadding.PaddingLeft = UDim.new(0, 15)
    uipadding.Parent = text_box
    
    local check_key = Instance.new("TextButton")
    check_key.Font = Enum.Font.Gotham
    check_key.Text = "Check Key"
    check_key.TextColor3 = Color3.new(1, 1, 1)
    check_key.TextSize = 13
    check_key.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
    check_key.BorderColor3 = Color3.new(0, 0, 0)
    check_key.BorderSizePixel = 0
    check_key.Position = UDim2.new(0.034285713, 0, 0.656000018, 2)
    check_key.Size = UDim2.new(0, 160, 0, 35)
    check_key.Visible = true
    check_key.Name = "CheckKey"
    check_key.Parent = canvas_group
    
    local uicorner_4 = Instance.new("UICorner")
    uicorner_4.CornerRadius = UDim.new(0, 4)
    uicorner_4.Parent = check_key
    
    local get_key = Instance.new("TextButton")
    get_key.Font = Enum.Font.Gotham
    get_key.Text = "Get Key"
    get_key.TextColor3 = Color3.new(1, 1, 1)
    get_key.TextSize = 13
    get_key.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
    get_key.BorderColor3 = Color3.new(0, 0, 0)
    get_key.BorderSizePixel = 0
    get_key.Position = UDim2.new(0.505714238, 0, 0.656000018, 2)
    get_key.Size = UDim2.new(0, 160, 0, 35)
    get_key.Visible = true
    get_key.Name = "GetKey"
    get_key.Parent = canvas_group
    
    local uicorner_5 = Instance.new("UICorner")
    uicorner_5.CornerRadius = UDim.new(0, 4)
    uicorner_5.Parent = get_key
    
    if discordInvite ~= "" then
        local discord = Instance.new("TextButton")
        discord.Font = Enum.Font.Gotham
        discord.Text = "Join the Discord Server"
        discord.TextColor3 = Color3.new(1, 1, 1)
        discord.TextSize = 13
        discord.BackgroundColor3 = Color3.new(0, 0.588235, 0.392157)
        discord.BorderColor3 = Color3.new(0, 0, 0)
        discord.BorderSizePixel = 0
        discord.Position = UDim2.new(0.034285713, 0, 0.819999993, 5)
        discord.Size = UDim2.new(0, 325, 0, 35)
        discord.Visible = true
        discord.Name = "Discord"
        discord.Parent = canvas_group
        
        local uicorner_6 = Instance.new("UICorner")
        uicorner_6.CornerRadius = UDim.new(0, 4)
        uicorner_6.Parent = discord

        discord.MouseButton1Click:Connect(function()
            JoinDiscord(discordInvite)
        end)
    else
        canvas_group.Size = UDim2.new(0, 350, 0, 185)
        text_box.Position = UDim2.new(text_box.Position.X.Scale, text_box.Position.X.Offset, text_box.Position.Y.Scale, 10)
        get_key.Position = UDim2.new(get_key.Position.X.Scale, get_key.Position.X.Offset, get_key.Position.Y.Scale, 20)
        check_key.Position = UDim2.new(check_key.Position.X.Scale, check_key.Position.X.Offset, check_key.Position.Y.Scale, 20)
    end

    function CloseGUI()
        game:GetService("TweenService"):Create(canvas_group, TweenInfo.new(0.45, Enum.EasingStyle.Linear), { Position = UDim2.new(0.5, 0, -1.5, 0) }):Play()
        game:GetService("TweenService"):Create(top_frame, TweenInfo.new(0.45, Enum.EasingStyle.Linear), { Position = UDim2.new(0.5, 0, -1.5, 0) }):Play()
        task.wait(0.45)
        key_system:Destroy()
        UIMade = false
    end

    close_btn.MouseButton1Click:Connect(function()
        KeySystemUI.Closed = true;CloseGUI()
    end)

	local KeyLibrary;
	local KeySystem;
   	local KeyClass;
   	local KeyLibRun, KeyLibError = pcall(function()
	   	--loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua"))()
	    --local KeySystem = _G.KSS.classes.keysystem.new(applicationName)
		KeyLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup_obf.lua'))()
		KeySystem = KeyLibrary.new(applicationName)
	   	KeyClass = KeySystem:key()
   	end)
   	if KeyLibError or KeyLibRun == false then
   		Notif.New("Failed to load the Key System: ".. tostring(KeyLibError))
   		CloseGUI()
   	else
	   	if KeyClass.is_banned then
	   		Notif.New("You are banned!")
   			CloseGUI()
   			return
	   	end
	   	
   		local CurrentKeyInput = ""
	    local SavedKeyPath = applicationName.."_key.txt"
	    local function iskeyvalid(key_input)
	        if key_input ~= nil then CurrentKeyInput = key_input end
	
			KeyClass = KeySystem:key()
			if KeyClass.is_banned then return false end
			return KeySystem:verifyKey(CurrentKeyInput) --(KeyClass.finish and KeySystem:verifyKey(CurrentKeyInput))
	    end
		function KeySystemUI.Finished() return iskeyvalid() end
	
	    if readfile and writefile then
	        local success_file, error_file = pcall(function()
	            local is_key_present = isfile(SavedKeyPath);
	
	            if is_key_present == true then
	            	Notif.New("Checking saved key...", 2)

	                local key_file_txt = readfile(SavedKeyPath)
	                local onl_key = iskeyvalid(key_file_txt)
	                
	                if onl_key then
	                	Notif.New("Saved key is valid! Loading "..tostring(name).."...", 5)
	                    CloseGUI()
	                else
	                    delfile(SavedKeyPath)
	                    Notif.New("Saved key is invalid.", 2)
	                end
	            end
	        end)
	        if error_file then
	            Notif.New("Failed to check saved key.", 5)
	            warn(error_file)
	        end
	    end
	
	    check_key.MouseButton1Click:Connect(function()
	        local keyValid = iskeyvalid(text_box.Text)
	        if keyValid then
	            if writefile then writefile(SavedKeyPath, CurrentKeyInput) end
	            Notif.New("Key is valid! Loading "..tostring(name).."...", 5)
	            CloseGUI()
	        else
				if KeyClass.is_banned then 
					Notif.New("You are banned!", 5)
				else 
					Notif.New("Invalid/Expired key!", 2)
				end
	            text_box.Text = ""
	        end
	    end)
	
	    get_key.MouseButton1Click:Connect(function()
	        text_box.Text = KeySystem:getKeyURL()
	        KeySystem:copyGetKeyURL()
	    end)
   	end
end

function KeySystemUI.New(settings) 
    settings = Validate({
        ApplicationName = "",
        Name = "",
        Info = "",
        DiscordInvite = ""
	}, settings or {})

    if typeof(settings.ApplicationName) ~= "string" then warn("ApplicationName needs to be a string!") return end
    if settings.ApplicationName == "" then warn("ApplicationName can't be empty!") return end
    MakeUi(settings.ApplicationName, settings.Name, settings.Info, settings.DiscordInvite)
end

return KeySystemUI

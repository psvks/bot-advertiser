
values = "2"

games = {
    "4483381587", -- fisrt game
    "2317712696" -- Wild West
}


chatSettings = {
    "Hello guys.", -- 1
    "Wsp guys" -- 2
}





-------------------------- CONFIG FINAL -------------------





















































































if handapi and handapi.Loaded then
    -- error('already running!')
end

function warnConsole(text)
    rconsolewarn("\n"..text.."\n")
end

function consoleErr(text)
    rconsoleerr("\n [SERVER]: "..text.."\n")
end

warnConsole("You've been teleported to this placeId: "..game.PlaceId)

local array = 'api_handler_bit_request'
local coreGui = 'CORE 1'
local initial = game.CreatorId
local api;

function says(message)
    warnConsole("Sent message to 'all'... message contains: "..message)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message ,"All")
end

function getApi()
    if api == true then 
        api.bit32.arshift(true)
    else
        api.bit32()
        api = true
        return api
    end
end

function request( ... )
    getApi()
end


function notifyString(type: string, description: string)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
		Title = "Handler - "..type;
		Text = description
	})
end




function handler_request()
    if core.Loaded and core then
        coreGui = 'CORE 1 - Initial!'

    else
        print('Initial with default core.')
    end
end

local handler = loadstring(readfile('robloxSetupApi/handler/handler.lua'))
local api = loadstring(readfile('robloxSetupApi/handler/api.lua'))                 -- ALL SETTINGS AND VALUES NEEDED. DO NOT TOUCH IF YOU DON'T KNOW WHAT ARE YOU DOING.
local chat = loadstring(readfile('robloxSetupApi/config/chatsettings.lua'))
local values = loadstring(readfile('robloxSetupApi/config/values.lua'))


local valueGameSetting = Instance.new("NumberValue", game.Workspace) -- random math for game joiner.
local valueChatSetting = Instance.new("NumberValue", game.Workspace) -- ramdom math for chat.
local index = valueGameSetting.Value
local indexchat = valueChatSetting.Value



function getRamdomMath(type: string, value: string)
    if type == "chat" then
        if value == "" then
            notifyString("Err", "Is 'value: string' empty? Please assing atleast a number. The value was set to ten for default settings.")
            value = 10
            valueChatSetting.Value = math.random(1, value)
        else
            valueChatSetting.Value = math.random(1, value)
            indexchat = valueChatSetting.Value
            warnConsole("Generated ramdom number for chat.")
        end
    elseif type == "game" then
        if value == "" then
            notifyString("Err", "Is 'value: string' empty? Please assing atleast a number. The value was set to ten for default settings.")
            value = 10
            valueGameSetting.Value = math.random(1, value)
        else
            valueGameSetting.Value = math.random(1, value)
            index = valueGameSetting.Value
            warnConsole("Generated ramdom number for game.")
        end
    end
end






function leave()
    game:Shutdown()
end


    function rejoin()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        warnConsole("Rejoining game.")
        ts:Teleport(games[index], p)
    end
    function say()
        says(chatSettings[index])
        warnConsole("Sent message.")
    end
    function say_and_rejoin()
        says(chatSettings[index])
        wait(1)
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        warnConsole("Rejoining game and sent message.")
        ts:Teleport(games[index], p)

    end




local function helper()
    if handler then
        handler_request()
        request()
    end
end


--[[
    FUNCTIONS ABOVE HERE. Thanks.
]]





getRamdomMath("game" ,"2") -- declares ramdom number for games and chat. Needs to be the same as the variable values.
getRamdomMath("chat", "2")
say_and_rejoin() -- rejoins a game



















































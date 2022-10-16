repeat task.wait() until game.GameId ~= 0

if handler.loaded then
    -- already executed.
end

local api = false
local array = 'api_handler_bit_request'
local coreGui = 'CORE 1'
local initial = game.CreatorId


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
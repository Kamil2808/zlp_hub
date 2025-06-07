getgenv().retry = getgenv().retry or 5
getgenv().webhook = getgenv().webhook_link or ""
if getgenv().webhook_link then
    getgenv().webhook_link = nil
end
getgenv().bonds = getgenv().bonds or 0
getgenv().fps = getgenv().fps or false

print("Executing ZLP_HUB dead rails script...")

-- Load and execute the script
if game.PlaceId == 70876832253163 then 
    if getgenv().fps then
         game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
    local zov = false
    if not isfolder("ZLP_HUB") then  
        makefolder("ZLP_HUB") 
    end  
    if not isfile("ZLP_HUB/Dead_Rails.dat") then
        writefile("ZLP_HUB/Dead_Rails.dat", "{}")
    end
    local data = game:GetService("HttpService"):JSONDecode(readfile("ZLP_HUB/Dead_Rails.dat")) 
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)] then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)] = {}
    end
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry = 0
    end
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds = 0
    end
    if getgenv().retry ~= 0 then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry = data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry + 1
        if data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry > getgenv().retry then
            zov = true
            data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry = 0
        end
    end
    if getgenv().bonds ~= 0 then
        if data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds > getgenv().bonds then
            zov = true
        end
    end

    writefile("ZLP_HUB/Dead_Rails.dat", game:GetService("HttpService"):JSONEncode(data))
    if zov then
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(116495829188952, p)
    end
    
    if (tonumber(data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds) > getgenv().bonds) and (getgenv().webhook ~= "") then
        local OSTime = os.time()
		local Time = os.date('!*t', OSTime)
		local Content = ''
		local Embed = {
		    title = game:GetService("Players").LocalPlayer.Name, 
		    description = "Has more than " .. game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text .. " bonds",
		    color = 5814783,
		    footer = {
		        text = "ZLP_HUB"
		   },  
		    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
		}
		local requestFunc = syn and syn.request or http_request or request  
		requestFunc({
		    Url = getgenv().webhook,
		    Method = 'POST',
		    Headers = {
		        ['Content-Type'] = 'application/json'
		    },
		    Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
		})
    else
        local dt = DateTime.now().UnixTimestamp
        -- getgenv().disable_auto_execute = true
        -- getgenv().auto_bond = true
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/OP-AUTO-BONDS-V3/refs/heads/main/Keyless-BONDS-v3"))()
        end)

        if not success then
            warn(errorMessage)
        end
        
        local x = true
        local v = true
        local f = true
        
        local CardScreen = game:GetService("CoreGui"):WaitForChild("CardScreen")

        while x do
            -- if ((DateTime.now().UnixTimestamp - dt) > 15) and (CardScreen.Background.MainFrame.Holder:GetChildren()[4]:GetChildren()[3].Text == "0") then
            --     if v then
            --         if getgenv().webhook ~= "" then
            --             local OSTime = os.time()
	    	--             local Time = os.date('!*t', OSTime)
	    	--             local Content = ''
	    	--             local Embed = {
	    	--                 title = game:GetService("Players").LocalPlayer.Name, 
	    	--                 description = "Failed!",
	    	--                 color = 16721703,
	    	--                 footer = {
	    	--                     text = "ZLP_HUB"
	    	--                },  
	    	--                 timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
	    	--             }
	    	--             local requestFunc = syn and syn.request or http_request or request  
	    	--             requestFunc({
	    	--                 Url = getgenv().webhook,
	    	--                 Method = 'POST',
	    	--                 Headers = {
	    	--                     ['Content-Type'] = 'application/json'
	    	--                 },
	    	--                 Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
	    	--             })
            --         end
            --         local args = {
           	-- 		    false
        	-- 	    }
        	-- 	    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EndDecision"):FireServer(unpack(args))
            --         game.Players.LocalPlayer.Character:BreakJoints()
            --         v = false
            --     end
	    	-- end
            if ((DateTime.now().UnixTimestamp - dt) > 100) then
                local ts = game:GetService("TeleportService")
                local p = game:GetService("Players").LocalPlayer
                ts:Teleport(116495829188952, p)
            end

            -- if CardScreen.Background.MainFrame.Holder.Frame:GetChildren()[3].Text == "Resetting Character" and f then
            --     f = false
            --     local data = game:GetService("HttpService"):JSONDecode(readfile("ZLP_HUB/Dead_Rails.dat")) 
            --     data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds = tonumber(data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds) + tonumber(CardScreen.Background.MainFrame.Holder:GetChildren()[4]:GetChildren()[3].Text)
            --     writefile("ZLP_HUB/Dead_Rails.dat", game:GetService("HttpService"):JSONEncode(data))
            --     if getgenv().webhook ~= "" then
            --         local OSTime = os.time()
		    --         local Time = os.date('!*t', OSTime)
		    --         local Content = ''
		    --         local Embed = {
		    --             title = game:GetService("Players").LocalPlayer.Name, 
		    --             description = "Has " .. data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds .. " bonds",
		    --             color = 5814783,
		    --             footer = {
		    --                 text = "ZLP_HUB"
		    --            },  
		    --             timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
		    --         }
		    --         local requestFunc = syn and syn.request or http_request or request  
		    --         requestFunc({
		    --             Url = getgenv().webhook,
		    --             Method = 'POST',
		    --             Headers = {
		    --                 ['Content-Type'] = 'application/json'
		    --             },
		    --             Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
		    --         })
            --     end
            -- end
            -- wait(1)      
        end
    end

elseif game.PlaceId == 116495829188952 then
    if getgenv().fps then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
    if not isfolder("ZLP_HUB") then  
        makefolder("ZLP_HUB") 
    end  
    if not isfile("ZLP_HUB/Dead_Rails.dat") then
        writefile("ZLP_HUB/Dead_Rails.dat", "{}")
    end
    local data = game:GetService("HttpService"):JSONDecode(readfile("ZLP_HUB/Dead_Rails.dat")) 
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)] then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)] = {}
    end
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)].retry = 0
    end
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds = 0
    end
    wait(3)
    data[tostring(game:GetService("Players").LocalPlayer.UserId)].bonds = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text)
    writefile("ZLP_HUB/Dead_Rails.dat", game:GetService("HttpService"):JSONEncode(data))
    if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text) > getgenv().bonds then
        if getgenv().webhook ~= "" then
            local OSTime = os.time()
		    local Time = os.date('!*t', OSTime)
		    local Content = ''
		    local Embed = {
		        title = game:GetService("Players").LocalPlayer.Name, 
		        description = "Has more than " .. tostring(getgenv().bonds) .. " bonds",
		        color = 5814783,
		        footer = {
		            text = "ZLP_HUB"
		       },  
		        timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
		    }
		    local requestFunc = syn and syn.request or http_request or request  
		    requestFunc({
		        Url = getgenv().webhook,
		        Method = 'POST',
		        Headers = {
		            ['Content-Type'] = 'application/json'
		        },
		        Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
		    })
        end
    else
        if getgenv().webhook ~= "" then
            local OSTime = os.time()
		    local Time = os.date('!*t', OSTime)
		    local Content = ''
		    local Embed = {
		        title = game:GetService("Players").LocalPlayer.Name, 
		        description = "Has " .. game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text .. " bonds",
		        color = 5814783,
		        footer = {
		            text = "ZLP_HUB"
		       },  
		        timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
		    }
		    local requestFunc = syn and syn.request or http_request or request  
		    requestFunc({
		        Url = getgenv().webhook,
		        Method = 'POST',
		        Headers = {
		            ['Content-Type'] = 'application/json'
		        },
		        Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
		    })
        end
        local dt = DateTime.now().UnixTimestamp
        while true do
            if (DateTime.now().UnixTimestamp - dt) > 60 then
                local ts = game:GetService("TeleportService")
                local p = game:GetService("Players").LocalPlayer
                ts:Teleport(116495829188952, p)
                wait(1)
            else
                local z = workspace.PartyZones.PartyZone.BillboardGui.PlayerCount.Text
                local ammount = z:sub(1, 1)
                if ammount == "0" then
                    workspace.PartyZones.PartyZone.Hitbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    wait(0.1)

                    local args = {
	                    {
		                    isPrivate = true,
		                    maxMembers = 1,
		                    trainId = "default",
		                    gameMode = "Normal"
	                    }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("CreateParty"):FireServer(unpack(args))
                end
                wait(1)
            end 
        end
    end
else 
    print("Not dead rails game!")
end


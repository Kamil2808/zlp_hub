getgenv().retry = 5
getgenv().webhook_link = "https://discord.com/api/webhooks/1374067084316905582/m2zdxBhr-_6tLk5xiOo8j-OZXLCuTSXKdjwf6m-G_lGTafdmmaerLMq_v9a0zlwyTw0b"
getgenv().bonds = 5700
        
print("Executing ZLP_HUB dead rails script...")

-- Load and execute the script
if game.PlaceId == 70876832253163 then 
    print("help3")
    local zov = false
    if not isfolder("ZLP_HUB") then  
        makefolder("ZLP_HUB") 
    end  
    if not isfile("ZLP_HUB/Dead_Rails.dat") then
        writefile("ZLP_HUB/Dead_Rails.dat", "{}")
    end
    local data = game:GetService("HttpService"):JSONDecode(readfile("ZLP_HUB/Dead_Rails.dat")) 
    if not data[tostring(game:GetService("Players").LocalPlayer.UserId)] then
        data[tostring(game:GetService("Players").LocalPlayer.UserId)] = 1
    else
        data[tostring(game:GetService("Players").LocalPlayer.UserId)] = data[tostring(game:GetService("Players").LocalPlayer.UserId)] + 1
    end
    if data[tostring(game:GetService("Players").LocalPlayer.UserId)] > getgenv().retry then
        zov = true
        data[tostring(game:GetService("Players").LocalPlayer.UserId)] = 0
    end
    writefile("ZLP_HUB/Dead_Rails.dat", game:GetService("HttpService"):JSONEncode(data))
    if zov then
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(116495829188952, p)
    end
    
    local dt = DateTime.now().UnixTimestamp
    getgenv().disable_auto_execute = true
    getgenv().auto_bond = true
    loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
    local x = true
    
    while x do
        if (DateTime.now().UnixTimestamp - dt) > 180 then
			local args = {
       			false
    		}
    		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EndDecision"):FireServer(unpack(args))
            game.Players.LocalPlayer.Character:BreakJoints()
        end
        wait(1)      
    end

elseif game.PlaceId == 116495829188952 then
    print("help2")
    if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text) > getgenv().bonds then
        local OSTime = os.time()
		local Time = os.date('!*t', OSTime)
		local Content = ''
		local Embed = {
		    title = game:GetService("Players").LocalPlayer.Name, 
		    description = "Has more than " + tostring(getgenv().bonds) + " bonds",
		    color = 5814783,
		    footer = {
		        text = "ZLP_HUB"
		   },  
		    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
		}
		local requestFunc = syn and syn.request or http_request or request  
		requestFunc({
		    Url = getgenv().webhook_link,
		    Method = 'POST',
		    Headers = {
		        ['Content-Type'] = 'application/json'
		    },
		    Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
		})
    else
        print("help1")
        local dt = DateTime.now().UnixTimestamp
        while true do
            if (DateTime.now().UnixTimestamp - dt) > 60 then
                local ts = game:GetService("TeleportService")
                local p = game:GetService("Players").LocalPlayer
                ts:Teleport(116495829188952, p)
                wait(1)
            else
                print("help")
                local z = workspace.PartyZones.PartyZone.BillboardGui.PlayerCount.Text
                local ammount = z:sub(1, 1)
                if ammount == "0" then
                    workspace.PartyZones.PartyZone.Hitbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    wait(0.1)
                    local args = {
                        {
                            trainId = "default",
                            maxMembers = 1,
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

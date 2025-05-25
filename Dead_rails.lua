print("Executing dead rails script...")

-- Load and execute the script
local success, err = pcall(function()
    if game.PlaceId == 70876832253163 then 
        local zov = false

        if not isfolder("ZLP_HUB") then  
            makefolder("ZLP_HUB")  -- Создаём папку, если её нет  
        end  

        if not isfile("ZLP_HUB/Dead_Rails.dat") then
            writefile("ZLP_HUB/Dead_Rails.dat", "{}")
        end

        local data = game:GetService("HttpService"):JSONDecode(readfile("ZLP_HUB/Dead_Rails.dat")) -- {"nick1": 1, "nick": 1}

        if not data[tostring(game:GetService("Players").LocalPlayer.UserId)] then
            data[tostring(game:GetService("Players").LocalPlayer.UserId)] = 1
        else
            data[tostring(game:GetService("Players").LocalPlayer.UserId)] = data[tostring(game:GetService("Players").LocalPlayer.UserId)] + 1
        end

        if data[tostring(game:GetService("Players").LocalPlayer.UserId)] > 5 then
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
        getgenv().webhook_link = "https://discord.com/api/webhooks/1374067084316905582/m2zdxBhr-_6tLk5xiOo8j-OZXLCuTSXKdjwf6m-G_lGTafdmmaerLMq_v9a0zlwyTw0b"
        loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
        local x = true
        
        while x do
            if (DateTime.now().UnixTimestamp - dt)/1000 > 180 then
				print("l")
				local args = {
           			false
        		}
        		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EndDecision"):FireServer(unpack(args))
                game.Players.LocalPlayer.Character:BreakJoints()
                x = false
            end
            wait(1)      
        end
        
    elseif game.PlaceId == 116495829188952 then
        if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BondDisplay.BondInfo.BondCount.Text) > 5700 then
            local OSTime = os.time()
			local Time = os.date('!*t', OSTime)
			local Content = ''
			local Embed = {
			    title = game:GetService("Players").LocalPlayer.Name,  -- Используйте `=` вместо `:`
			    description = "Has more than 5700 bonds",
			    color = 5814783,
			    footer = {
			        text = "ZLP_HUB"
 			   },  -- Запятая вместо точки с запятой
			    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec)
			}

			local requestFunc = syn and syn.request or http_request or request  -- Добавлен `request` для других эксплоитов
			requestFunc({
			    Url = 'https://discord.com/api/webhooks/1374067084316905582/m2zdxBhr-_6tLk5xiOo8j-OZXLCuTSXKdjwf6m-G_lGTafdmmaerLMq_v9a0zlwyTw0b',
			    Method = 'POST',
			    Headers = {
			        ['Content-Type'] = 'application/json'
			    },
			    Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
			})
        else
            local dt = DateTime.now().UnixTimestamp
            while true do
                if (dt - DateTime.now().UnixTimestamp)/1000 > 60 then
                    local ts = game:GetService("TeleportService")
                    local p = game:GetService("Players").LocalPlayer
                    ts:Teleport(116495829188952, p)
                else
                    local z = workspace.PartyZones.PartyZone.BillboardGui.PlayerCount.Text
                    local ammount = tonumber(z:match("%d+"))
                    if ammount == 0 then
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
                        wait(0.1)
                    end
                    wait(0.1)
                end 
            end
        end
    else 
        print("Not dead rails game!")
    end
end)

local PlayersService = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local banDataStore = DataStoreService:GetDataStore("banDataStore")
local admins = require(script.Admins)
local kickmessages = require(script.KickMessages)

-- THIS USES ID RATHER THEN PLAYERNAME

PlayersService.PlayerAdded:Connect(function(Player)
	
	Player.Chatted:Connect(function(Message)
		
		if table.find(admins, Player.Name) then
			local splitstring = string.split(Message, " ")
			local bancommand = splitstring[1]
			local userid = splitstring[2]
			
			if bancommand == ":ban" then
				
				
				local success, errormessage = pcall(function()
					banDataStore:SetAsync(userid, true)
				end)
				
				if success then
					print(userid.."has been banned forever!")
					
					local player = game.Players:GetPlayerByUserId(userid)
					if player ~= nil then
						local kickmessages = player.Player
						player:Kick(kickmessages[math.random(1, #kickmessages)])
					end
				end
			end
		end
		
	end)
	
end)

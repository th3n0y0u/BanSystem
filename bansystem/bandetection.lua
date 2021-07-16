local DataStoreService = game:GetService("DataStoreService")
local banDataStore = DataStoreService:GetDataStore("banDataStore")
local manualBan = require(script.Parent.ManualBan)
local kickmessages = require(script.Parent.KickMessages)

game.Players.PlayerAdded:Connect(function(player)
	
	local playerUserId = player.UserId
	
	if manualBan[playerUserId] then
		player:Kick(kickmessages[math.random(1, #kickmessages)])
	end
	
	local banned
	local success, errormessage = pcall(function()
		banned = banDataStore:GetAsync(playerUserId)
	end)
	
	if banned == true then
		player:Kick(kickmessages[math.random(1, #kickmessages)])
	end
	
end)

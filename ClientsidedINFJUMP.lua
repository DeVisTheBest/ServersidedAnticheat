-- Run with cheats/exploits
local AllowedJumpHeight = 100 -- studs
local lastMagnitude = {}

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		while true do
			local root = character:WaitForChild("HumanoidRootPart")
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			local raycast = workspace:Raycast(root.Position, 
				Vector3.new(0, -(humanoid.JumpHeight + humanoid.HipHeight + AllowedJumpHeight), 0))

			if not raycast then -- Dont want them to die if they just fell from a building right?
				if (root.Position.Y > lastMagnitude[player.Name]) then
              				print(player.Name .. " is using infinite jump!")
				end
			end
			lastMagnitude[player.Name] = root.Position.Y
			wait(.7) -- I tested multiple waittimes and .7 is the best in my opinion
		end
	end)
end)

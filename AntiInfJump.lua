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
				print(root.Position.Y, lastMagnitude[player.Name])
				if (root.Position.Y > lastMagnitude[player.Name]) then
					if not humanoid.Health == 0 then
						-- When testing the client version, i figured out that because of the little fling you get when you get killed it thinks you're using a cheat
						print("Punishing player ".. player.Name .. " | Reason: Infinite Jump")
						humanoid:TakeDamage(humanoid.Health) -- Do whatever you want here, i would kill the player but you can kick them if you want
					end
				end
			end
			lastMagnitude[player.Name] = root.Position.Y
			wait(.7) -- I tested multiple waittimes and .7 is the best in my opinion
		end
	end)
end)

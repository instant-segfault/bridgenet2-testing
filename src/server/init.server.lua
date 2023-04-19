local BridgeNet2 = require(game.ReplicatedStorage.Packages.BridgeNet2)

-- Calling ReferenceBridge() will return either a ServerBridge or ClientBridge metatable depending on the enviroment.
local bridge = BridgeNet2.ReferenceBridge("Example")

-- We can specify how many requests this bridge can receive per second.
bridge:RateLimit(10, function(player)
	-- Setting a rate limit also allows you to have a callback function.
    -- If this function returns true, then the rate limit will be ignored.
	if player.Name == "Roblox" then
        return true
	end
    print(player.Name .. " triggered the ratelimiter")
end)

-- We can connect to events sent from clients like normal, with one difference, arguments are now defined in a table, instead of multiple variables.
bridge:Connect(function(player, args)
    print("Received event from "..player.Name)
	for _, argument in args do
        print(argument)
    end

    -- Send player's ID and their sent arguments back to all clients.
    -- BridgeNet2 has multiple utility functions for getting players, see the documentation.
    bridge:Fire(BridgeNet2.AllPlayers(), {player.UserId, unpack(args)})
end)

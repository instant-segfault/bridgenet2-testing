local BridgeNet2 = require(game.ReplicatedStorage.Packages.BridgeNet2)

-- The name string must be the same as the one on the server.
local bridge = BridgeNet2.ReferenceBridge("Example")

-- We will connect to the event just like we did on the server.
bridge:Connect(function(args)
    print("Received event from server")
	for _, argument in args do
        print(argument)
    end
end)

-- Like normal, send our data to the server.
bridge:Fire({"Hello", "Server"})

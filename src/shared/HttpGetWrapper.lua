local HttpService = game:GetService("HttpService")
local Promise = require(game.ReplicatedStorage.Packages.promise)

return function(url)
	return Promise.new(function(resolve, reject)
		local success, result = pcall(HttpService.GetAsync, HttpService, url)

		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
end

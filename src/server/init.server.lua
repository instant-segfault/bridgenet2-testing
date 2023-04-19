local HttpGetWrapper = require(game.ReplicatedStorage.Common.HttpGetWrapper)

HttpGetWrapper("https://cat-fact.herokuapp.com/facts"):andThen(print)
Gamestate = require("hump.gamestate")
require("ui.Textbutton")
menu = require("states.Menu")
signals = require("hump.signal")
game = require("states.Game")
multiplayer = require("states.Multiplayer")
require("ents.Player")

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(menu)

	signals.register("gamestart", (function()
		Gamestate.switch(game)
	end))

	signals.register("setup", (function()
		Gamestate.switch(multiplayer)
		print("Going to multiplayer")
	end))

	signals.register("menu", (function()
		Gamestate.switch(menu)
	end))
end


function love.update(dt)

end

function love.mousepressed(x, y)

end

function love.draw()

end
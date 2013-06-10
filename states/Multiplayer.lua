signal = require("hump.signal")
require("ui.Textbox")
multiplayer = {}

function multiplayer:enter()
	btns = {}
	txts = {}

	local x = 420
	local y = 400
	local bf = love.graphics.newFont("fnt/munro_small.ttf", 30)

	back = Textbutton:new(x + 111, y, "Back", bf, (function()
		--Nothing right now
		--love.event.quit()
		signal.emit("menu")
	end))
	table.insert(btns, back)

	--x, y, width, height, max, default
end

function multiplayer:mousepressed(x, y)
	table.foreach(btns, (function(_, btn)
		btn:MousePressed(x, y)
	end))
end

function multiplayer:keypressed(key, code)
	
end


function multiplayer:draw()
	table.foreach(btns, (function(_, btn)
		btn:Draw()
	end))
end

return multiplayer
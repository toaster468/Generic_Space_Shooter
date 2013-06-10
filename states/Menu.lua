require("ui.Textbutton")
require("wrld.Star")
require("ui.Textbox")
require("ui.News")
signals = require("hump.signal")

menu = {}

function menu:enter()
	btns = {}
	local x = 420
	local y = 400
	local bf = love.graphics.newFont("fnt/munro_small.ttf", 30)

	quit = Textbutton:new(x + 120, y, "Quit", bf, (function()
		love.event.quit()
	end))
	table.insert(btns, quit)
 
	y = y - 35

	single = Textbutton:new(x, y, "Single Player", bf, (function()
		signals.emit("gamestart")
	end))
	table.insert(btns, single)

	y = y - 35

	multi = Textbutton:new(x + 18, y, "Multiplayer", bf, (function()
		signals.emit("setup")
	end))
	table.insert(btns, multi)

	news = News:new(641, 0, 640, 12)
end

function menu:update(dt)
	news:Update(dt)
end

function menu:mousepressed(x, y)
	table.foreach(btns, (function(_, btn)
		btn:MousePressed(x, y)
	end))

end

function menu:keypressed(key, code)
	
end


function menu:draw()
	table.foreach(btns, (function(_, btn)
		btn:Draw()
	end))

	news:Draw()
end

return menu
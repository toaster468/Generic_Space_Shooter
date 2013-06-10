require("wrld.World")

game = {}

function game:init()
	world = World:new(640, 480)
	world:Setup()
end

function game:update(dt)
	world:Update(dt)
end

function game:draw()
	world:Draw()
end

function game:keyreleased(key)
	if key == "escape" then
		world.paused = not world.paused
	end

	world:KeyReleased(key)
end


function game:mousepressed()
	world:MousePressed()
end

function game:keypressed(k)
	world:KeyPressed(k)
end

return game
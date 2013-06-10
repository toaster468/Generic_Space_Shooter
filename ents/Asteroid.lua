require("ents.Entity")
require("util.Angles")
vector = require("hump.vector")
class = require("30log")

Asteroid = class(Entity)
Asteroid.__name = "Asteroid"

function Asteroid:__init(x, y, radius)
	self.x = x
	self.y = y
	self.pos = vector(x, y)
	self.radius = radius
	self.points = createasteroid(x, y, 40)
	self.isasteroid = true
end

function Asteroid:Update(dt)
	self:Move(2 * dt, 0.5 * dt)
end

function Asteroid:Move(x, y)
	self.x = self.x + x
	self.y = self.y + y
	self.pos = vector(self.x, self.y)

	table.foreach(self.points, (function(i, a)
		if i % 2 == 0 then
			self.points[i] = self.points[i] + y
			--print("Changing y", self.points[i] + y)
		else
			self.points[i] = self.points[i] + x
			--print("Changing x", self.points[i] + x)
		end
	end))
end

function Asteroid:Draw()
	love.graphics.polygon("fill", self.points)
end

function Asteroid:GetShape()
	return unpack(self.points)
end

function Asteroid:GetCenter()
	return self.x, self.y
end
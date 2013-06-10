class = require("30log")
vector = require("hump.vector")
vl = require("hump.vector-light")
require("ents.Entity")

Bullet = class(Entity)
Bullet.__name = "Bullet"
_speed = 16

function Bullet:__init(x, y, rot)
	self.pos = vector(x, y)
	self.rot = rot
	self.isbullet = true
end

function Bullet:Draw()
	local x, y = self.pos:unpack()
	love.graphics.rectangle("fill", x, y, 4, 4)
end

function Bullet:Update(dt)
	local n = vector(math.cos(self.rot), math.sin(self.rot)):perpendicular()
	self.pos = self.pos + (n * 10)
end

function Bullet:GetShape()
	local x, y = self.pos:unpack()
	return x, y
end

function Bullet:GetCenter()
	return self.pos:unpack()
end
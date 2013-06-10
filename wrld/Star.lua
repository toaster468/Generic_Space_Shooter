class = require("30log")
Vector = require("hump.vector")

Star = class()
Star.__name = "Star"

function Star:__init(x, y, size)
	self.pos = Vector(x, y)
	self.size = size
end

function Star:GetSize()
	return self.size / 1000
end

function Star:GetRadiusPx()
	return 4
end
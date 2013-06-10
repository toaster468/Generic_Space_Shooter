class = require("30log")
vector = require("hump.vector")
signal = require("hump.signal")
timer = require("hump.timer")
vlight = require("hump.vector-light")
require("ents.Entity")
require("ents.Bullet")

Player = class(Entity)
Player.__name = "Player"

function Player:__init(x, y, color)
	self.rot = 100
	self.pos = vector(x, y)
	self.color = color
	self.img = love.graphics.newImage("img/ship.png")
	self.speed = 3
	self.maxspeed = 6
	self.isplayer = true
	self.bullets = {}
end

function Player:Draw()
	local px, py = self.pos:unpack()
	love.graphics.draw(self.img, px, py, self.rot, 1, 1, 8, 16)
end

--[[
	Taken from http://www.love2d.org/wiki/Additional_math
]]
function math.angle(x1,y1, x2,y2) return math.atan2(x2-x1, y2-y1) end

function Player:AimTo(v)
	--print(self.pos:unpack(), v:unpack())
	local px, py = self.pos:unpack()
	local vx, vy = v:unpack()

	self.rot = -math.angle(px + 8, py + 16, vx, vy)
end

function Player:Accelerate(dt)
	local px, py = self.pos:unpack()
	n = vector(math.cos(self.rot), math.sin(self.rot)):perpendicular()
	self.pos = self.pos + (n * self.speed * dt * 25)

	self.speed = math.min(self.speed + self.speed * (dt / 8), self.maxspeed)
	self.accelerating = true
end

function Player:Update(dt)
	self:AimTo(vector(love.mouse.getX(), love.mouse.getY()))

	if self.accelerating then
		self:Accelerate(dt)
	else
		self.speed = math.max(0, self.speed - (dt / 100))
		print("Stopping")
	end
end

function Player:KeyReleased(k)
	if k == "w" then
		self.accelerating = false
		self.speed = 3
	end
end

function Player:KeyPressed(k)
	if k == "w" then
		self.accelerating = true
	end
end

function Player:GetCenter()
	local x, y = self.pos:unpack()
	return x + 8, y + 16
end

function Player:GetShape()
	local x, y = self.pos:unpack()
	return x, y, 8, 16
end
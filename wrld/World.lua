require("30log")
--require("Star")
require("ents.Player")
require("ents.Entity")
require("ents.Asteroid")
HC = require("hardoncollider")

World = class()
World.__name = "World"


function World:__init(w, h)
	self.w = w
	self.h = h

	self.entities = {}
	pl = Player:new((640 / 2) - 16, (480 / 2) - 16)
	table.insert(self.entities, pl)
	self.paused = false

	self.collider = HC(100, collided)
	self.collisionmaps = {}
end

function World:Setup()
	self:Add(as)
	--self:Add(pl)
	--self:Add(Asteroid:new(200, 200, 10))
end

function World:Sync()
	--idk do something here?
end

function World:Add(e)
	table.insert(self.entities, e)

	if e.isasteroid then
		e.shape = self.collider:addPolygon(e:GetShape())
		table.insert(self.collisionmaps, self.collider:addPolygon(e:GetShape()))
	elseif e.isbullet then
		e.shape = self.collider:addPoint(e:GetShape())
		table.insert(self.collisionmaps, self.collider:addPoint(e:GetShape()))
	elseif e.isplayer then
		table.insert(self.collisionmaps, self.collider:addRectangle(e:GetShape()))
		e.shape = self.collider:addRectangle(e:GetShape())
	end

	print(#self.entities, #self.collisionmaps)
end

function World:Update(dt)
	if world.paused then return end

	table.foreach(self.entities, (function(_, e)
		e:Update(dt)
		e.shape:moveTo(e.pos:unpack())
		e.shape:setRotation(e.rot or 0)
	end))

	self.collider:update(dt)
end

times = 0
function collided(dt, shapea, shapeb)
	times = times + 1
	print(shapea, shapeb)
end

function World:Draw()
	table.foreach(self.entities, (function(_, e)
		e:Draw()
		local c = love.graphics.getColor()
		love.graphics.setColor(255, 0, 0)
		e.shape:draw()
		love.graphics.setColor(255, 255, 255)
	end))
end

function World:MousePressed()
	table.foreach(self.entities, (function(_, p)
		if p.isplayer then
			local x, y = p.pos:unpack()
			local b = Bullet:new(x, y, p.rot)
			self:Add(b)
		end
	end))
end

function World:KeyReleased(k)
	table.foreach(self.entities, (function(_, p)
		if p.isplayer then
			p:KeyReleased(k)
			print("Player released button")
		end
	end))
end

function World:KeyPressed(k)
	table.foreach(self.entities, (function(_, p)
		if p.isplayer then
			p:KeyPressed(k)
		end
	end))
end
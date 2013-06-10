class = require("30log")
http = require("socket.http")

News = class()
News.__name = "News"

function News:__init(x, y, w, h)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.news = http.request("http://192.73.239.25/gss/news.txt")
	self.font = love.graphics.getFont() or love.graphics.newFont("fnt/munro_small.ttf", 30)
	self.delay = 0
	print("Loaded news", self.news)
end

function News:Update(dt)
	local len = -self.font:getWidth(self.news)

	if self.x < len then 
		self.x = 641
	else
		self.x = self.x - (50 * dt)
	end

	if self.delay > 100 then
		self.news = http.request("http://192.73.239.25/gss/news.txt")
		self.delay = 0
	else
		self.delay = self.delay + dt
		--print(self.delay)
	end
end

function News:Draw()
	love.graphics.print(self.news, self.x, self.y)
end
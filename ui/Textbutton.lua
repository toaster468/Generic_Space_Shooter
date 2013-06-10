class = require("30log")

Textbutton = class()

function Textbutton:__init(x, y, txt, fnt, func)
	self.x = x
	self.y = y
	self.w = fnt:getWidth(txt)
	self.h = fnt:getHeight(txt)
	self.text = txt
	self.font = fnt
	self.func = func
end

function Textbutton:Draw()
	--local f = love.graphics.getFont()
	love.graphics.setFont(self.font)

	love.graphics.print(self.text, self.x, self.y)
	--love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
	--love.graphics.setFont(f)
end

function Textbutton:MousePressed(x, y)
	if(x >= self.x and x <= (self.x + self.w) and y >= self.y and y <= (self.y + self.h)) then self.func() return end
end
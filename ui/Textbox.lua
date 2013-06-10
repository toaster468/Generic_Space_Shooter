class = require("30log")

Textbox = class()
Textbox.__name = "Textbox"

function Textbox:__init(x, y, width, height, max, default)
	self.x = x
	self.y = y
	self.w = width
	self.h = height 
	self.max = max or 24
	self.text = default or ""
	self.cursor = 0
	self.active = false
end

function Textbox:OnComplete(func)
	self.complete = func or (function() end)
end

function Textbox:KeyPressed(key, code)
	if not self.active then return end

	if (code > 31) and (code < 127) and (string.len(self.text) < self.max) then
		self.text = self.text .. key
		self.cursor = self.cursor + 1
	elseif key == "backspace" then
		self.cursor = math.max(0, self.cursor - 1)
		self.text = string.sub(self.text, 0, self.cursor)
	elseif key == "return" then
		self.complete(self.text)
		self.active = false
	end
end

function Textbox:Activate()
	self.active = true
end

function Textbox:MousePressed(x, y)
	if(x >= self.x and x <= (self.x + self.w) and y >= self.y and y <= (self.y + self.h)) then self:Activate() return end
end

function Textbox:Draw()
	love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
	love.graphics.print(self.text, self.x, self.y)
end
signal = require("hump.signal")
class = require("30log")
tween = require("tween")

Achievement = class()
Achievement.__name = "Achievement"

function Achievement:__init(title, desc)
	self.title = title
	self.desc = desc

	signal.register("get", (function(a)
		if a ~= self.title then return end

		self.visible = true
	end))

	self.color = {149, 165, 166, 255}
	self.bordercolor = {189, 195, 199, 255}
	self.w = 128
	self.
end

function Achievement:Draw()
	if not self.visible then return end


end

function Achievement:Update(dt)
	if self.visible then
		tween.update(dt)	
	else
		tween.resetAll()
	end
end
class = require("30log")

Entity = class()
Entity.__name = "Entity"
Entity.__tostring = "Instance of base class Entity"

function Entity:__init()

end

function Entity:Draw()

end

function Entity:Update(dt)

end

function Entity.IsPlayer(p)
	print(p)
	return p.__name == "Player"
end

function Entity:KeyPressed(key)

end
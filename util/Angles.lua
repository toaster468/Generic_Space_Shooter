function toradian(deg)
	return ((deg / 360) * 2 * math.pi)
end

function createpoint(deg, len)
	local x = math.sin(toradian(180 - deg)) * len
	local y = math.cos(toradian(180 - deg)) * len

	return x, y
end

function createasteroid(x, y, radius)
	points = {}

	for i = 1, 8 do
		local deg = i * 45
		local len = 0.4 + math.random() * 1

		local px, py = createpoint(deg, len * radius)
		table.insert(points, px + x)
		table.insert(points, py + y)
	end

	return points
end
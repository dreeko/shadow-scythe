function love.load()
	love.window.setMode(30 * 32, 20 * 32)
	X = 100
	Y = 100
	FLOOR = 0
	CEIL = 20 * 32
	WALL = 30 * 32
	map_fn = require("load_map")
	tile_set = map_fn.load_tileset("assets/1 Tiles/", "swamp_1_tiles")
	map = map_fn.load_map("map", "swamp_1")
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		X = clamp(X + 60 * dt, FLOOR, WALL)
	end
	if love.keyboard.isDown("down") then
		Y = clamp(Y + 60 * dt, FLOOR, CEIL)
	end
	if love.keyboard.isDown("up") then
		Y = Y - 60 * dt
	end
	if love.keyboard.isDown("left") then
		X = clamp(X - 60 * dt, FLOOR, WALL)
	end
end

function love.draw()
	map_fn.draw_map(map, tile_set)
	love.graphics.rectangle("line", X, Y, 10, 10)
end

function clamp(num, lim_min, lim_max)
	if num > lim_max then
		num = lim_max
	elseif num < lim_min then
		num = lim_min
	else
		return num
	end
end

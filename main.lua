function love.load()
	love.window.setMode(30 * 32, 20 * 32)
	X = 100
	Y = 100
	FLOOR = 0
	CEIL = 20 * 32
	WALL = 30 * 32
	love.physics.setMeter(64) --the height of a meter our worlds will be 64px
	World = love.physics.newWorld(0, 9.81 * 64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
	Map_fn = require("load_map")
	Tile_set = Map_fn.load_tileset("assets/1 Tiles/", "swamp_1_tiles")
	Map = Map_fn.load_map("map", "swamp_1")
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		X = Clamp(X + 60 * dt, FLOOR, WALL)
	end
	if love.keyboard.isDown("down") then
		Y = Clamp(Y + 60 * dt, FLOOR, CEIL)
	end
	if love.keyboard.isDown("up") then
		Y = Y - 60 * dt
	end
	if love.keyboard.isDown("left") then
		X = Clamp(X - 60 * dt, FLOOR, WALL)
	end
end

function love.draw()
	Map_fn.draw_map(Map, Tile_set)
	love.graphics.rectangle("line", X, Y, 10, 10)
end

function Clamp(num, lim_min, lim_max)
	if num > lim_max then
		num = lim_max
	elseif num < lim_min then
		num = lim_min
	else
		return num
	end
end

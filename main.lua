function love.load()
	love.window.setMode(30 * 32, 20 * 32)
	X = 100
	Y = 100
	FLOOR = 0
	CEIL = 20 * 32
	WALL = 30 * 32
	JUMP_CD = 1
	love.physics.setMeter(64) --the height of a meter our worlds will be 64px
	World = love.physics.newWorld(0, 9.81 * 64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
	Map_fn = require("load_map")
	Map = Map_fn.load_world("swamp_1", "swamp_1_tiles")
	Map_fn.init_physics(Map)
end

function love.update(dt)
	World:update(dt)
	JUMP_CD = JUMP_CD + dt
	if love.keyboard.isDown("right") then
		Map.objects.player.body:applyForce(150, 0)
	end
	if love.keyboard.isDown("down") then
	end
	if love.keyboard.isDown("up") then
		if JUMP_CD >= 1 then
			Map.objects.player.body:applyLinearImpulse(0, -50)
			JUMP_CD = 0
		end
	end
	if love.keyboard.isDown("left") then
	end
end

function love.draw()
	Map_fn.draw_map(Map)
	love.graphics.draw(Map.tileset[10].sprite, Map.objects.player.body:getX(), Map.objects.player.body:getY())
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

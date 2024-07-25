return {
	load_world = function(map_name, tileset_name)
		local map = dofile("./map/" .. map_name .. ".lua")
		map.tileset = {}
		map.objects = {}
		local tile_map = dofile("./assets/1 Tiles/" .. tileset_name .. ".lua")
		for _, v in pairs(tile_map.tiles) do
			map.tileset[v.id + 1] = {
				sprite = love.graphics.newImage("assets/1 Tiles/" .. v.image),
				type = v.type,
			}
		end
		for i, value in ipairs(map.layers[1].data) do
			table.insert(map.objects, {
				sprite = value,
				type = map.tileset[value].type,
				pos = {
					x = ((i - 1) % map.layers[1].width) * 32,
					y = math.floor((i - 1) / map.layers[1].width) * 32,
				},
			})
		end
		return map
	end,

	draw_map = function(map)
		for _, obj in pairs(map.objects) do
			love.graphics.draw(map.tileset[obj.sprite].sprite, obj.pos.x, obj.pos.y)
		end
	end,

	init_physics = function(map)
		for tile in map.tiles do
			if tile.type == "Wall" then
				love.physics.newBody(World, tile.pos.x, tile.pos.y, "static")
			end
		end
	end,
}

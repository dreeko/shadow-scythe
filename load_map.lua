return {
	load_map = function(path, module)
		local map = dofile(path .. "/" .. module .. ".lua")
		return map.layers[1]
	end,
	draw_map = function(map, in_tiles)
		for i = 1, #map.data, 1 do
			--print(x .. " " .. y .. " " .. map.data[x * y])
			love.graphics.draw(
				in_tiles[map.data[i]].sprite,
				((i - 1) % map.width) * 32,
				math.floor((i - 1) / map.width) * 32
			)
		end
	end,
	load_tileset = function(res_path, tileset_name)
		local tiles = {}
		local tile_map = dofile(res_path .. tileset_name .. ".lua")
		for _, v in pairs(tile_map.tiles) do
			tiles[v.id + 1] = { sprite = love.graphics.newImage(res_path .. v.image), type = v.type }
		end
		return tiles
	end,
}

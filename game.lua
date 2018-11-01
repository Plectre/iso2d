local Game = {}
Game.__index = Game



Game.Map = {
        {1, 1, 1, 1, 3, 1},
        {1, 1, 1, 2, 3, 1},
        {1, 3, 3, 3, 3, 1},
        {1, 3, 1, 2, 1, 1},
        {1, 3, 2, 1, 1, 1},
        {1, 3, 1, 1, 1, 1},
}

Game.TileTexture = {}

function Game.load()
    Game.TileTexture[0] = nil
    Game.TileTexture[1] = love.graphics.newImage("img/tile_ground_1.png")
    Game.TileTexture[2] = love.graphics.newImage("img/tile_ground_2.png")
    Game.TileTexture[3] = love.graphics.newImage("img/tile_ground_3.png")
    Game.TileTexture[4] = love.graphics.newImage("img/tile_ground_4.png")
    Game.TileTexture[5] = love.graphics.newImage("img/tile_ground_5.png")
end
return Game
--[[ function map.load() 
    images = {}
    images[1] = love.graphics.newImage("img/tile_ground_1.png")
    images[2] = love.graphics.newImage("img/tile_ground_2.png")
    images[3] = love.graphics.newImage("img/tile_ground_3.png")
    images[4] = love.graphics.newImage("img/tile_ground_4.png")
    images[5] = love.graphics.newImage("img/tile_ground_5.png")
    images[9] = love.graphics.newImage("img/test.png")
end ]]

--[[ function map.draw() 
    local li, col
    for li = 0, table.getn(map), 1 do
        for col = 0, table.getn(map[li]) do
            
        end
    end
end ]]
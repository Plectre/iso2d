


local Sprites = {}
Sprites.images = {}
Sprites.dim = {}
Sprites.isActive = false

Sprites.map = {
    {1, 1, 1, 1},
    {2, 1, 2, 3},
    {1, 2, 2, 1},
    {3, 2, 1, 3}
}


function Sprites.load() 
    print("Sprites chargement texture")
    Sprites.images[1] = love.graphics.newImage("img/tile_ground_1.png")
    Sprites.images[2] = love.graphics.newImage("img/tile_ground_2.png")
    Sprites.images[3] = love.graphics.newImage("img/tile_ground_3.png")
    Sprites.images[4] = love.graphics.newImage("img/tile_ground_4.png")
    Sprites.images[5] = love.graphics.newImage("img/tile_ground_5.png")
    Sprites.images[9] = love.graphics.newImage("img/test.png")
    print("Chargement termine...")
end

function Sprites.draw() 
    local col, lig
    for lig = 1, table.getn(Sprites.map), 1 do
        for col = 1, table.getn(Sprites.map[lig]), 1 do
            if (Sprites.map[lig][col] ~= 0) then
                Sprites.x = ((col - lig) * img_width / 2) + centerX
                Sprites.y = ((col + lig) * img_height / terraForming) + centerY
                if (Sprites.map[lig][col] == 1) then
                    love.graphics.draw(Sprites.images[1], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 2) then
                    love.graphics.draw(Sprites.images[2], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 3) then
                    love.graphics.draw(images[3], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 9) then
                    love.graphics.draw(images[9],Sprites.x, Sprites.y)
                end
            end
        end
    end
end

function Sprites.mouseOver(mouseX, mouseY)
    if(mouseX > Sprites.x and mouseX < (Sprites.x) + (img_width /2)
          and mouseY > Sprites.y and mouseY < (Sprites.y) + (img_height/2)) then
            print("......")
    end

end
return Sprites

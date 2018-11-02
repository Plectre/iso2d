local Sprites = {}

Sprites.images = {}
Sprites.isActive = false
Sprites.imgWidth = 0
Sprites.imgHeight = 0
Sprites.x = 0
Sprites.y = 0
Sprites.lig = 0
Sprites.col = 0
Sprites.text = ""

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
    --local col, lig
    Sprites.img_width = Sprites.images[1]:getWidth()
    Sprites.imgHeight = Sprites.images[1]:getHeight()
    for lig = 1, table.getn(Sprites.map), 1 do
        for col = 1, table.getn(Sprites.map[lig]), 1 do
            Sprites.lig = lig
            Sprites.col = col
            if (Sprites.map[lig][col] ~= 0) then
                Sprites.x = ((col - lig) * Sprites.img_width / 2) + centerX
                Sprites.y = ((col + lig) * img_height / terraForming) + centerY
                if (Sprites.map[lig][col] == 1) then
                    love.graphics.draw(Sprites.images[1], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 2) then
                    love.graphics.draw(Sprites.images[2], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 3) then
                    love.graphics.draw(images[3], Sprites.x, Sprites.y)
                elseif (Sprites.map[lig][col] == 9) then
                    love.graphics.draw(images[9], Sprites.x, Sprites.y)
                end
            end
            Sprites.mouseOver(centerX, centerY)
        end
    end
end

function Sprites.mouseOver(centerX, centerY)
    local mouseCol, mouseLig
    local mapLength = table.getn(Sprites.map)
    local mousePosX = (love.mouse.getX() - 64)
    local mousePosY = (love.mouse.getY() - 64)
    -- test si la souris est sur l'aire de jeu
    if (mousePosX > centerX - (mapLength * 64) and mousePosX < centerX + (mapLength * 64)
        and mousePosY > centerY and mousePosY < centerY + (mapLength * 64)) then
        Sprites.text = "On map !"
        local newMousePosX = math.floor((mousePosX - centerX))
        if (newMousePosX == Sprites.x) then
            print(Sprites.x)
        end
    else Sprites.text = "Not on Map ! "
    end
end
return Sprites


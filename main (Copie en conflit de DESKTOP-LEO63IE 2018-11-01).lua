

images={}
images[1] = love.graphics.newImage("img/tile_ground_1.png")
images[2] = love.graphics.newImage("img/tile_ground_2.png")
images[3] = love.graphics.newImage("img/tile_ground_3.png")
images[4] = love.graphics.newImage("img/tile_ground_4.png")
images[5] = love.graphics.newImage("img/tile_ground_5.png")
images[9] = love.graphics.newImage("img/test.png")

terraForming = 4
isMousePressed = false

offsetX = 0 -- Decallage entre mouseX et le centerX lors du clic
offsetY = 0 -- Decallage entre mouseY et centerY lors du clic

map = {}
img_width = images[1]:getWidth()
img_height = images[1]:getHeight()

require "map"
require "init"

-- ************** LOAD *******************************
function love.load() 
  love.window.setMode(WIDTH, HEIGHT,  {fullscreen=false, vsync=true, minwidth=800, minheight=600})
  love.graphics.setBackgroundColor(0, 0, 0)
  love.window.setTitle("2D iso")
  map.createMap()
end
-- ******************* DRAW ******************************
function love.draw()
  displayMap()
  tileMouse()
  --displayMapZindex()
  printText("mx: "..mouseX.." my: "..mouseY, 10, 10)
  printText("cx: "..centerX.." cy: "..centerY, 10, 25)
  printText("ox: "..offsetX.." oy: "..offsetY, 10, 40)
end
-- **************** UPDATE *************************
function love.update(dt)
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
  local mousePosX = centerX + offsetX
  local mousePosY = centerY + offsetY
  --local x, y = love.mouse.getPosition()
  if isMousePressed == true then
    camera()
  end
end
-- ******************* GESTION SOURIS *******************
-- Le bouton est pressé on recupére la position x, y de souris et l'id du bouton droit
function love.mousepressed(mousex, mousey, button)
  if (button == 2) then
    mouseX = mousex
    mouseY = mousey
    offsetX = mouseX - centerX
    offsetY = mouseY - centerY
    isMousePressed = true
  end
end
-- Le bouton est relaché
function love.mousereleased()
  isMousePressed = false
end
-- Et la roue tourne .....
function love.wheelmoved(x, y)
  if y < 0 then 
    terraForming = terraForming + 0.2
  end
  if y > 0 then 
    terraForming = terraForming - 0.2
  end
end
function camera()
  centerX = love.mouse.getX() - offsetX
  centerY = love.mouse.getY() - offsetY
end

function printText(text, x, y)
  love.graphics.print(text, x, y)
end

function displayMap()
  local col, lig
  for lig=1, table.getn(map), 1 do
    for col=1, table.getn(map[lig]), 1 do
      if (map[lig][col] ~= 0) then 
        local x = (col-lig) * img_width /2
        local y = (col+lig) * img_height / terraForming
        if (map[lig][col] == 1) then
            love.graphics.draw(images[1], x + centerX, y + centerY)
        elseif (map[lig][col] == 2) then
          love.graphics.draw(images[2], x + centerX, y + centerY)
        elseif (map[lig][col] == 3) then
          love.graphics.draw(images[3], x + centerX, y + centerY)
        elseif (map[lig][col] == 9) then
          love.graphics.draw(images[9], x + centerX, y + centerY)
        end
      end
    end 
  end
end
-- Gestion souris sur tiles
function tileMouse()
  local col, lig
  local posX = centerX + offsetX
  local posY = centerY + offsetY
  for lig=1, table.getn(map), 1 do
    for col=1, table.getn(map[lig]), 1 do
      if (map[lig][col] ~= 0) then 
        local x = (col-lig) * img_width /2
        local y = (col+lig) * img_height / terraForming
        if(posX > x + centerX and posX < (x + centerX) + (img_width)
            and posY > y + centerY and posY < (y + centerY) + (img_height/3)) then
            map[lig][col] = 9
       end
      end
    end 
  end 
end
-- Gestion profondeur de champs
function displayMapZindex()
  local col, lig
  for lig=1, table.getn(map), 1 do
    for col=1, table.getn(map[lig]), 1 do
      if (map[lig][col] ~= 0) then 
        local x = (col-lig) * img_width /2
        local y = (col+lig) * img_height / terraForming
        if (map[lig][col] == 4) then
            love.graphics.draw(images[4], x + centerX, y + centerY)
        elseif (map[lig][col] == 5) then
          love.graphics.draw(images[5], x + centerX, y + centerY)
        end
      end
    end 
  end
end
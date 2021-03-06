

images={}
images[1] = love.graphics.newImage("img/tile_ground_1.png")
images[2] = love.graphics.newImage("img/tile_ground_2.png")
images[3] = love.graphics.newImage("img/tile_ground_3.png")
images[4] = love.graphics.newImage("img/tile_ground_4.png")
images[5] = love.graphics.newImage("img/tile_ground_5.png")

terraForming = 4
isMousePressed = false
mouseX = 0
mouseY = 0
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
  --displayMapZindex()
end
-- **************** UPDATE *************************
function love.update(dt)
  local x, y = love.mouse.getPosition()
  print(x.." : "..centerX.." ; "..offsetX)
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
require "init"

local oldLig
local oldCol

local sprites = require("Sprites")
local camera = require("Camera")
local mouse = require("input")
images = sprites.images

terraForming = 4
isMousePressed = false

offsetX = 0 -- Decallage entre mouseX et le centerX lors du clic
offsetY = 0 -- Decallage entre mouseY et centerY lors du clic
mouseOffsetX = 0
mouseOffsetY = 0

-- ************** LOAD *******************************
function love.load()
  love.window.setMode(WIDTH, HEIGHT, {fullscreen = false, vsync = true, minwidth = 800, minheight = 600})
  love.graphics.setBackgroundColor(0, 0, 0)
  love.window.setTitle("2D iso")
  sprites.load()
  img_height = sprites.images[1]:getHeight()
  img_width = sprites.images[1]:getWidth()
end
-- ******************* DRAW ******************************
function love.draw()
  sprites.draw()
  --displayMap()
  --tileMouse()
  --displayMapZindex()
  --printText("mx: " .. mouseX .. " my: " .. mouseY, 10, 10)
  --printText("cx: " .. centerX .. " cy: " .. centerY, 10, 25)
  --printText("ox: " .. offsetX .. " oy: " .. offsetY, 10, 40)
  --printText("cox: " .. mouseOffsetX .. "coy: " .. mouseOffsetY, 10, 55)
end
-- **************** UPDATE *************************
function love.update(dt)
  mouse.mousePos()
  --sprites.mouseOver(mouse.mousePosX, mouse.mousePosY)
  local mousePosX = centerX + offsetX
  local mousePosY = centerY + offsetY
  mouseOffsetX = mouseX - centerX
  mouseOffsetY = mouseY - centerY
  --tileMouse()
  if isMousePressed == true then
    moveCamera()
  end
end
-- ******************* GESTION SOURIS *******************
-- Le bouton est pressé on recupére la position x, y de souris et l'id du bouton droit
function love.mousepressed(mousex, mousey, button)
  mouse.mousePressed(button)
end
-- Le bouton est relaché
function love.mousereleased()
  mouse.mousereleased()
end
-- Et la roue tourne .....
function love.wheelmoved(x, y)
  mouse.wheelmoved(x, y)
end
function moveCamera()
  camera.moveCamera()
end

function printText(text, x, y)
  love.graphics.print(text, x, y)
end


-- Gestion souris sur tiles
function tileMouse()
  local col, lig
  local oldTile
  local posX = centerX + mouseOffsetX
  local posY = centerY + mouseOffsetY
  for lig=1, table.getn(sprites.map), 1 do
    for col=1, table.getn(sprites.map[lig]), 1 do
      if (sprites.map[lig][col] ~= 0) then 
        local x = (col-lig) * img_width /2
        local y = (col+lig) * img_height / terraForming
        if(posX > x + centerX and posX < (x + centerX) + (img_width /2)
          and posY > y + centerY and posY < (y + centerY) + (img_height/2)) then
            if (lig ~= oldLig or col ~= oldCol and oldTile ~= 9) then
              print("~===============================================")
              oldTile = map[lig][col]
              print(oldTile)
              oldLig = lig
              oldCol = col
              map[lig][col] = 9
            else
              map[oldLig][oldCol] = oldTile
              print(oldTile)
            end
        end
      end
    end 
  end 
end
--[[Gestion profondeur de champs
function displayMapZindex()
  local col, lig
  for lig = 1, table.getn(map), 1 do
    for col = 1, table.getn(map[lig]), 1 do
      if (map[lig][col] ~= 0) then
        local x = (col - lig) * img_width / 2
        local y = (col + lig) * img_height / terraForming
        if (map[lig][col] == 4) then
          love.graphics.draw(images[4], x + centerX, y + centerY)
        elseif (map[lig][col] == 5) then
          love.graphics.draw(images[5], x + centerX, y + centerY)
        end
      end
    end
  end
end
]]
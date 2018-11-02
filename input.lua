local input = {}


input.getMousePosX = nil
input.getMousePosY = nil

-- Renvoie la position de la souris
function input.mousePos()
    input.getMousePosX = love.mouse.getX()
    input.getMousePosY = love.mouse.getY()
end

function input.mousePressed(btn)
    if (btn == 2) then
        offsetX = input.getMousePosX - centerX
        offsetY = input.getMousePosY - centerY
        isMousePressed = true
    end
end

-- Le bouton est relaché
function input.mousereleased()
    isMousePressed = false
end

-- Et la roue tourne .....
function input.wheelmoved(x, y)
    if y < 0 then
        terraForming = terraForming + 0.2
    end
    if y > 0 then
        terraForming = terraForming - 0.2
    end
end

return input

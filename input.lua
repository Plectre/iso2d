local input = {}

-- Renvoie la position de la souris
function input.mousePos()
    input.mousePosX, input.mousePosY  = love.mouse.getPosition()
end

function input.mousePressed(btn)
    if (btn == 2) then
      offsetX = input.mousePosX - centerX
      offsetY = input.mousePosY - centerY
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
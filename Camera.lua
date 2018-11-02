local Camera = {}

function Camera.moveCamera()
    centerX = love.mouse.getX() - offsetX
    centerY = love.mouse.getY() - offsetY
end
return Camera

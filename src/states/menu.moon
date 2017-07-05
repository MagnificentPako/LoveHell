Menu = Game\addState "Menu"

Menu.draw = =>
    love.graphics.setColor 255, 255, 255
    love.graphics.circle "fill", 300, 300, 50, 100

Menu.update = (dt) =>
    if love.keyboard.isDown "a"
        self\gotoState "InGame"

return Menu
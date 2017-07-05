InGame = Game\addState "InGame"
CircleAction = require "actions.circle"
TestAction = require "actions.test"

bullets = {}
x,y = 500,500
timer = 0 
deg = 0

InGame.enteredState = =>
    self.action = TestAction\new(x,y)

InGame.draw = =>
    love.graphics.setColor(255, 0, 255)
    for k,v in pairs self.action\currentState!
        love.graphics.circle("fill", v.x, v.y, 5)


InGame.update = (dt) =>
    self.action\update(dt)

    for k,v in pairs(bullets)
        v\update(dt)
    
    if love.keyboard.isDown "s"
        self\gotoState "Menu"

InGame
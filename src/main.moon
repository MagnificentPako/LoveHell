require "globals"

local state

love.load = ->
    state = Game\new!
    state\gotoState "Menu"

love.update = (dt) ->
    GlobalStack\update dt
    state\update dt

love.draw = ->
    state\draw!
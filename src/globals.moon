export *

clazz = require "lib.middleclass"
Stateful = require "lib.stateful"
cron = require "lib.cron"
Game = require "states.game"
Menu = require "states.menu"
InGame = require "states.ingame"
Bullet = require "obj.bullet"
Action = require "actions.action"
UpdateStack = require "updatestack"
deferred = require "lib.deferred"

GlobalStack = UpdateStack\new!

deg_to_rad = (deg) ->
    deg * math.pi / 180

cron.after_promise = (delay, ...) ->
    d = deferred.new!
    args = {...}
    GlobalStack\add (cron.after delay, ->
        d\resolve unpack(args)
    )
    d
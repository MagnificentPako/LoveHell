TestAction = clazz "TestAction", Action

TestAction.initialize = (origX, origY) =>
    Action.initialize @
    @x = origX
    @y = origY
    @stack = UpdateStack\new!
    for i = 1, 10, 0.1
        local b
        cron.after_promise(i)\next(->
            j = #@bullets + 1
            b = Bullet\new @x, @y, 180, 200
            @bullets[j] = b
            cron.after_promise 1, b
        )\next((b)->
            print(b)
            b\set_angle 0
            b\set_speed 0
        )

TestAction.update = (dt) =>
    @stack\update dt
    for k,v in pairs @bullets
        v\update dt

TestAction.currentState = =>
    @bullets

TestAction.finished = =>
    false

TestAction
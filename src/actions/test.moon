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
            cron.after_promise 1, j
        )\next((j) ->
            @bullets[j]\setAngle(270)
            cron.after_promise 1, j
        )\next((j) ->
            @bullets[j]\setAngle(0)
            cron.after_promise 1, j
        )\next((j) ->
            @bullets[j]\setAngle(90)
            cron.after_promise 1, j
        )\next((j) ->
            @bullets[j] = nil
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
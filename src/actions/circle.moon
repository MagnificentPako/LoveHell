CircleAction = clazz "CircleAction", Action

CircleAction.initialize = (origX, origY) =>
    Action.initialize(self)
    @deg = 0
    @origX = origX
    @origY = origY
    @bullets = {}
    @calls = 0
    @finished = false
    @stack = UpdateStack\new!
    for i = 1, 360, 10
        @bullets[#@bullets + 1] = Bullet\new @origX, @origY, i, 200

    @stack\add (cron.every 0.05, ->
        for k,v in pairs @bullets
            v\setSpeed v.speed-5
    )

    @stack\add (cron.after 4, ->
        @finished = true
        @bullets = {}
    )

CircleAction.update = (dt) =>
    @stack\update dt
    for k,v in pairs @bullets
        v\update dt

CircleAction.currentState = =>
    @bullets

CircleAction.finished = =>
    @finished

CircleAction
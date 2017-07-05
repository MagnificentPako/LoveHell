Action = clazz "Action"

Action.initialize = =>
    self.bullets = {}

Action.update = (dt) =>

Action.currentState = =>
    self.bullets

Action.finished = =>
    true

Action
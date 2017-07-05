UpdateStack = clazz "UpdateStack"

UpdateStack.initialize = (...) =>
    @objects = {...}

UpdateStack.add = (obj) =>
    @objects[#@objects + 1] = obj

UpdateStack.update = (dt) =>
    for k,v in pairs @objects
        v\update dt

UpdateStack
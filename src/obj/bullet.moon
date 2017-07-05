Bullet = clazz "Bullet"

Bullet.initialize = (x, y, angle, speed) =>
    @x = x
    @y = y
    @angle = angle
    @speed = speed
    @\update_dir!

Bullet.update_dir = =>
    _angle = deg_to_rad @angle
    @dx = @speed * math.cos(_angle)
    @dy = @speed * math.sin(_angle)

Bullet.setSpeed = (speed) =>
    @speed = speed
    @\update_dir!

Bullet.setAngle = (angle) =>
    @angle = angle
    @\update_dir!

Bullet.update = (dt) =>
    @x = @x + @dx*dt
    @y = @y + @dy*dt

Bullet
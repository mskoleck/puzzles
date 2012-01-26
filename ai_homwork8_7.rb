#!/usr/bin/ruby


x = 0.0
y = 0.0
theta = 0
omega = Math::PI/8.0
v = 10.0
dt = 4

t = 0

while t < 16
  t += dt
  x = x + (v * dt * Math::cos(theta));
  y = y + (v * dt * Math::sin(theta));
  theta = theta + (omega * dt)

  puts "t = #{t} x = #{x}, y = #{y}, theta = #{theta}"

end


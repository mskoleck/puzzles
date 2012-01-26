#!/usr/bin/ruby

require 'pp'

# zadanie 14 XXVI miedzynarodowe mistrzostwa w grach matematycznych i
# logicznych eliminacje

# problem solving code - brute force
# given the following graph
#                 0
#      /------triangle-------\
#     /                       \
#    /                         \
# 6 /                           \  1
# hexagon        / ----------- hexagon
#   |           /                  |
#   |          /                   |
# 5 |    _____/                    |  2
# hexagon______                pentagon
#    \         \___              /
#     \            \_____      /
#      \                 \   /
#   4  square------------hexagon  3

# in triangle the digit is equal to the first digit from the left of the result of multiplying digits in adjacent polygons
# in square the digit is equal to the last digit from the right of the result of multiplying digits in adjacent polygons
# in pentagon the digit is equal to the first digit from the left of the sum of digits in adjacent polygons
# in hexagon the digit is equal to the last digit from the right of the sum of digits in adjacent polygons (2, 3 or 4)

def digits(num)
num.to_s.chars.map(&:to_i)
end

def run_validations(a, validations) 
  validations.each do |v| 
    result = v.call(a)
    return false unless result
  end
  true
end

perms = (1..7).to_a.permutation.to_a

validations = Array.new

validations[0] = lambda do |a| 
  m = a[-1] * a[1]
  fd = digits(m).first
  return true  if fd == a[0]
  return false
end

validations[1] = lambda do |a| 
  s = a[0] + a[2] + a[5]
  ld = digits(s).last
  return true if ld == a[1]
  return false
end

validations[2] = lambda do |a| 
  s = a[1] + a[3]
  fd = digits(s).first
  return true if fd == a[2]
  return false
end

validations[3] = lambda do |a| 
  s = a[2] + a[4] + a[5]
  ld = digits(s).last
  return true if ld == a[3]
  return false
end

validations[4] = lambda do |a| 
  m = a[5] * a[3]
  fd = digits(m).last
  return true if fd == a[4]
  return false
end

validations[5] = lambda do |a| 
  s = a[6] + a[1] + a[3] + a[4]
  fd = digits(s).last
  return true if fd == a[5]
  return false
end

validations[6] = lambda do |a| 
  s = a[5] + a[0]
  fd = digits(s).last
  return true if fd == a[6]
  return false
end

perms.each do |p|
  pp p if run_validations(p, validations)
end



#!/usr/bin/ruby

#zadanie 9 XXVI miedzynarodowe mistrzostwa w grach matematycznych i logicznych eliminacje
#find all 4 digit numbers divisible by 11 where sum of the digits is equal to 11

require 'pp'


(1000..9999).each do |n|
  s = n.to_s
  ds = s.chars.map(&:to_i).reduce(:+)

  puts n if (n % 11) == 0 && ds == 11
end

#!/usr/bin/ruby

# zadanie 14 XXVI miedzynarodowe mistrzostwa w grach matematycznych i
# logicznych eliminacje

#find all 2 digit numbers with the following property: their square
# and the square of a number created by transposing the digits can be
# written using the same digits (although in different order)

require 'pp'

def ordered_digits(num)
# standard idiom for that: 
#return num.to_s.chars.map(&:to_i).sort

# C style method
  a = Array.new
  i = 0
  while num > 0
    a[i] = num % 10
    num /= 10
    i += 1
  end
  a.sort
end


(10..99).each do |n|
  rev = (n % 10) * 10 + ((n / 10) % 10)
  sqr = n ** 2
  rev_sqr = rev ** 2
  puts "#{n} #{rev} #{sqr} #{rev_sqr}" if  sqr != rev_sqr && ordered_digits(sqr) == ordered_digits(rev_sqr)
end

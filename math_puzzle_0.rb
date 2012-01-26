#!/usr/bin/ruby

#zadanie 5 XXVI miedzynarodowe mistrzostwa w grach matematycznych i logicznych eliminacje

require 'pp'

def print_a(i, a)
  print i
  print "\t"
  a.each {|e| print e; print " "}
  puts
end


a = [0, 6, 9, 9, 2]
al = a.length

print_a(1, a)
(2..2012).each do |c|
  i = 0
  a = a.each_with_index.map {|e, i| (e - a[(i+1) % al]).abs }
  print_a(c, a)
end




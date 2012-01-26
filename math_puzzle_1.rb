#!/usr/bin/ruby

#zadanie 7 XXVI miedzynarodowe mistrzostwa w grach matematycznych i logicznych eliminacje

require 'pp'

def print_a(i, a)
  print i
  print "\t"
  a.each {|e| print e; print ""}
  puts
end


n = [1]

(1..13).each do |c|
  s = 0
  e = 0
  new_n = Array.new
  print_a(c, n)
  wp = 0
  while (s < n.length)
    e += 1 while (n[s] == n[e] && e < n.length)
    new_n[wp] = e - s
    new_n[wp+1] = n[s]
    s = e
    wp += 2
  end
  n = new_n

end

puts "solution: #{n.length}"

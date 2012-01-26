#!/usr/bin/ruby

# zadanie 14 XXVI miedzynarodowe mistrzostwa w grach matematycznych i
# logicznych eliminacje

#auxiliary code that will return all non repeating digits that sum up to a given total

require 'pp'
require 'set'

MIN_DIGIT = 1
MAX_DIGIT = 7

$digits = Set.new

def all_digits_for_sum(sum_val, digits_num, *excluded)
  puts "#{sum_val} can be written as a sum of #{digits_num} digits in the following ways: "
  rec_all_digits_for_sum(Array.new, sum_val, digits_num, *excluded)
end

def rec_all_digits_for_sum(digits_so_far, sum_val, digits_num, *excluded)
  if digits_num == 0
    if digits_so_far.reduce(:+) == sum_val
      #pp digits_so_far
      $digits.add(digits_so_far.sort)
    end
    return
  end

  all_digits = (MIN_DIGIT..MAX_DIGIT).to_a
  allowed_digits = ((all_digits - digits_so_far) - excluded)

  (allowed_digits).each do |d|
    next if !digits_so_far.empty? && digits_so_far.reduce(:+) + d > sum_val #optimization to prune some branches 
    digits_so_far.push(d)
    rec_all_digits_for_sum(digits_so_far, sum_val, digits_num - 1, *excluded)
    digits_so_far.pop()
  end

end


all_digits_for_sum(22, 4)
$digits.to_a.sort.each {|e| pp e}

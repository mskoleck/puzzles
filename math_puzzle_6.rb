#!/usr/bin/ruby

require 'pp'

# zadanie 16 XXVI miedzynarodowe mistrzostwa w grach matematycznych i
# logicznych eliminacje 2011/2012

# given the following multiplication:
#     * * *
#    x  * *
# ------------
#   * * * *
# * * * *
# ------------
# * * * * *
#
# and knowing that all digits in this multiplication are prime from the set {2, 3, 5, 7}
# find what this numbers are. * represents one digit from the set above. 



def digits(num)
  num.to_s.chars.map(&:to_i)
end

def multiply(f, s, check_f)
  pp f
  print "x "
  pp s
  partial_result = mult(f, digits(s), check_f)
  partial_result.each {|r| pp r}
  result = partial_result.reduce(:+)
end

def mult(first, second, check_f) 
  digit_results = Array.new
  second.reverse.each_with_index do |sd, i|
    single_digit_result  = sd * first 
    single_digit_result *= 10**i
    digit_results.push(single_digit_result)
  end
  digit_results
end


def all_combinations(allowed_digits, num_of_digits)
  combinations_list = Array.new
  _all_combinations(combinations_list, Array.new, allowed_digits, num_of_digits)
  combinations_list
end

def _all_combinations(combinations_list, current_combination, allowed_digits, num_of_digits)
  if num_of_digits == 0
    combinations_list.push(Array.new(current_combination))
    return
  end

  allowed_digits.each do |d|
    current_combination.push(d)
    _all_combinations(combinations_list, current_combination, allowed_digits, num_of_digits-1)
    current_combination.pop
  end
end




#!/usr/bin/ruby

require 'pp'

# zadanie 16 XXVI miedzynarodowe mistrzostwa w grach matematycznych i
# logicznych eliminacje 2011/2012

# given the following multiplication:
#      * * *
#     x  * *
#  ------------
#    * * * *
#  * * * *
# ------------
#  * * * * *
#
# and knowing that all digits in this multiplication are prime from the set {2, 3, 5, 7}
# find what this numbers are. * represents one digit from the set above. 


class Enumerator
  def lazy_select(&block)
    Enumerator.new do |yielder|
      self.each do |val|
      yielder.yield(val) if block.call(val)
      end
    end
  end
end

$allowed_digits = [2, 3, 5, 7]

def digits(num)
  num.to_s.chars.map(&:to_i)
end

def inc_first(a)
  [a].push([1,0]).transpose.map {|x| x.reduce(:+)}
end

def inc_second(a)
  [a].push([0,1]).transpose.map {|x| x.reduce(:+)}
end

def inc_dec(a)
  [a].push([1,-1]).transpose.map {|x| x.reduce(:+)}
end

def dec_inc(a)
  [a].push([-1,1]).transpose.map {|x| x.reduce(:+)}
end

def mult_contains_prime_digits_only?(pair)
  verify_f = (lambda { |v| (digits(v)-$allowed_digits).length == 0})

  f = pair[0];
  s = pair[1];
  verify_f.call(f) && verify_f.call(s) && check_multiply(f, s, verify_f)
end

def check_multiply(f, s, has_only_prime_digits_f)
  partial_result = mult(f, digits(s), has_only_prime_digits_f)
  return false if partial_result == nil
  result = partial_result.reduce(:+)
  return has_only_prime_digits_f.call(result)
end

def mult(first, second, has_only_prime_digits_f) 
  digit_results = Array.new
  second.reverse.each_with_index do |sd, i|
    single_digit_result  = sd * first 
    return nil unless has_only_prime_digits_f.call(single_digit_result)
    single_digit_result *= 10**i
    digit_results.push(single_digit_result)
  end
  digit_results
end


prime_digits_numbers_pairs = Enumerator.new do |yielder|
  initial_a = 100
  initial_b = 10
  pair = [initial_a,initial_b]
  direction = :up_left
  loop do
    yielder.yield pair
    if pair[0] == initial_a && direction == :up_left
      pair = inc_second(pair)
      direction = :down_right
    elsif pair[1] == initial_b && direction == :down_right
      pair = inc_first(pair)
      direction = :up_left
    elsif direction == :up_left
      pair = dec_inc(pair)
    elsif direction == :down_right
      pair = inc_dec(pair)
    end
  end
end

p prime_digits_numbers_pairs
  .lazy_select {|p| mult_contains_prime_digits_only?(p)}
  .first(1)

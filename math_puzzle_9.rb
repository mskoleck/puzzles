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

#  ************** Karwer's implementation ****************

$infinity = 1.0 / 0.0
$prime_digits = [2, 3, 5, 7]

class Enumerator
  def lazy_select(&block)
    Enumerator.new do |yielder|
      self.each do |val|
      yielder.yield(val) if block.call(val)
      end
    end
  end
end

class Fixnum
  def digits
    self.to_s.scan(/./).map{|c| c.to_i}
  end
 
  def is_prime_digit_number
    (self.digits - $prime_digits).empty?
  end
end

prime_digit_numbers = Enumerator.new do |yielder|
  list = $prime_digits.map{|p| [p]}
  loop do
    list.each do |elem|
      yielder << elem.flatten.inject{|s, n| 10*s+n}
    end
    list = list.product($prime_digits)
  end
end

def prime_digit_number_tuples(enum, n)
  return Enumerator.new do |yielder|
    list = []
    enum.each do |elem|
      list << elem
      prime_digit_number_tuples_req([elem], list, n-1).each do |tuple|
        yielder << tuple
      end
    end
  end
end

def prime_digit_number_tuples_req(acc, list, n)
  return Enumerator.new do |yielder|
    if n == 0
      acc.permutation.to_a.uniq.each do |elem|
        yielder << elem
      end
    else
      list.each do |elem|
        prime_digit_number_tuples_req(acc + [elem], list, n-1).each do |el|
          yielder << el
        end
      end
    end
  end
end


print prime_digit_number_tuples(prime_digit_numbers, 2)
  .lazy_select{|s| s[0] > 99 and s[0] < 1000 and s[1] > 9 and s[1] < 100}
  .lazy_select{|s| ([s[1]] + s[1].digits).all?{|d| (d * s[0]).is_prime_digit_number}}.first

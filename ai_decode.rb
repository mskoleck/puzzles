TEXT = "esp qtcde nzyqpcpynp zy esp ezatn zq lcetqtntlw tyepwwtrpynp hld spwo le olcexzfes nzwwprp ty estd jplc"


message = []
TEXT.each_byte do |b|
  if b == 32
    puts
    message << " "
    next
  end
  decoded = (b - 96 + 15) % 26
  decoded += 96
  puts "orig: #{b}, decoded: #{decoded}, char: #{decoded.chr}"
  message << decoded.chr
end

message.each {|c| print c}
puts



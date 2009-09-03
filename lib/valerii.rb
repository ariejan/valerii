require 'enumerator'

class Valerii
  # The encode character set
  ENCODE_CHARS = 
    %w( 0 1 2 3 4 5 6 7 
        8 9 A B C D E F 
        G H J K M N P Q 
        R S T V W X Y Z 
        a b c d e f h i 
        j k l m n o p q 
        r s t u v w x y 
        z = - + [ ] $ # )
    
  DECODE_MAP = ENCODE_CHARS.to_enum(:each_with_index).inject({}) do |h,(c,i)|
    h[c] = i; h
  end

  # Encodes an integer into a string
  #
  #   Valerii.encode(1234) # => "KJ"
  #
  def self.encode(number, opts = {})
    str = number.to_s(2).reverse.scan(/.{1,6}/).map do |bits|
      ENCODE_CHARS[bits.reverse.to_i(2)]
    end.reverse.join

    return str
  end

  # Decode a string to an integer
  #
  #   Valerii.decode("KJ") # => 1234
  #
  def self.decode(string)
    string.split(//).map { |char| 
      DECODE_MAP[char] or return nil 
    }.inject(0) { |result,val| (result << 6) + val }
  end
end

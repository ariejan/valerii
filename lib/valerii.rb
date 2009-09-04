require 'enumerator'

class Valerii

  ENCODE_CHARS = 
    %w( B C D F G H J K 
        M N P Q R S T V 
        W Z b c d f h j
        k m n p r x t v )
    
  DECODE_MAP = ENCODE_CHARS.to_enum(:each_with_index).inject({}) do |h,(c,i)|
    h[c] = i; h
  end

  # Encodes an integer into a string
  #
  #   Valerii.encode(1234) # => "KJ"
  #
  def self.encode(number, opts = {})
    str = number.to_s(2).reverse.scan(/.{1,5}/).map do |bits|
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
    }.inject(0) { |result,val| (result << 5) + val }
  end
end

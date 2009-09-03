require File.dirname(__FILE__) + '/test_helper.rb'

class TestValerii < Test::Unit::TestCase

  def test_encoding_and_decoding_single_chars
    from = (0..63).to_a
    to = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F G H J K M N P Q R S T V W X Y Z a b c d e f h i j k l m n o p q r s t u v w x y z = - + [ ] $ # )
    
    from.zip(to) do |symbol_value, encode_symbol|
      assert_equal encode_symbol, Valerii.encode(symbol_value)
      assert_equal symbol_value, Valerii.decode(encode_symbol)
    end
  end

  def test_encoding_larger_numbers
    assert_equal("a", Valerii.encode(32))
    assert_equal("KJ", Valerii.encode(1234))
    assert_equal("4eho9SK3ZEnB9zK4uaqucn=0dc4TZAltGrcjBj[G0000000000000000", Valerii.encode(10**100))
  end

  def test_decoding_strings
    assert_equal(32, Valerii.decode("a"))
    assert_equal(1234, Valerii.decode("KJ"))
    assert_equal(10**100, Valerii.decode("4eho9SK3ZEnB9zK4uaqucn=0dc4TZAltGrcjBj[G0000000000000000"))
  end

end
require File.dirname(__FILE__) + '/test_helper.rb'

class ValeriiTest < Test::Unit::TestCase

  def test_encoding_and_decoding_single_chars
    from = (0..31).to_a
    to = %w( B C D F G H J K M N P Q R S T V W Z b c d f h j k m n p r x t v )
    
    from.zip(to) do |symbol_value, encode_symbol|
      assert_equal encode_symbol, Valerii.encode(symbol_value)
      assert_equal symbol_value, Valerii.decode(encode_symbol)
    end
  end

  def test_encoding_larger_numbers
    assert_equal("CB", Valerii.encode(32))
    assert_equal("CJb", Valerii.encode(1234))
    assert_equal("GbNfdbmNWprxRHbVCJGmkHvKDhTMDKDDJcrfPmGJDHMHnKZBBBBBBBBBBBBBBBBBBBB", Valerii.encode(10**100))
  end

  def test_decoding_strings
    assert_equal(32, Valerii.decode("CB"))
    assert_equal(1234, Valerii.decode("CJb"))
    assert_equal(10**100, Valerii.decode("GbNfdbmNWprxRHbVCJGmkHvKDhTMDKDDJcrfPmGJDHMHnKZBBBBBBBBBBBBBBBBBBBB"))
  end

end
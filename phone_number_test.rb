
require 'minitest/autorun'

require_relative 'phone_number'

class PhoneNumberTest < Minitest::Test
  def setup; end

  def test_clean_number
    p_number = PhoneNumber.new('1234567890')
    assert_equal('(123) 456-7890', p_number.number)
  end

  def test_too_short_num
    p_number = PhoneNumber.new('11')
    assert_equal(nil, p_number.number)
  end

  def test_other_characters
    p_number = PhoneNumber.new('%1234567890')
    assert_equal(nil, p_number.number)
  end

  def test_wrong_first_number
    p_number = PhoneNumber.new('51234567890')
    assert_equal(nil, p_number.number)
  end

  def test_too_long_num
    p_number = PhoneNumber.new('111111122222233333344444')
    assert_equal(nil, p_number.number)
  end

  def test_already_formatted_num
    p_number = PhoneNumber.new('(123) 456-7890')
    assert_equal('(123) 456-7890', p_number.t0_s)
  end
end
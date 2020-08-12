# frozen_string_literal: true

def sum_two_digit_numbers(number)
  return number if number < 10

  array = number.divmod(10)
  array.inject(0) { |sum, x| sum + x }
end

def convert_number_to_array(number)
  number.to_s.split('').map(&:to_i)
end

def check_valid_luhn(luhn_number)
  array = convert_number_to_array(luhn_number)
  sum_numbers = array.reverse.each_with_index.inject(0) do |sum, (value, index)|
    number = value
    number *= 2 unless (index % 2).zero?
    sum + sum_two_digit_numbers(number)
  end

  (sum_numbers % 10).zero?
end

luhn_number = 499_273_987_176 # true
luhn_number2 = 79_927_398_713 # true
luhn_number3 = 123_426_242 # false
luhn_number4 = 8_285_728_192_342 # false

puts check_valid_luhn(luhn_number)
puts check_valid_luhn(luhn_number2)
puts check_valid_luhn(luhn_number3)
puts check_valid_luhn(luhn_number4)

# Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative. 
# This method should check if a number is odd, returning true if its absolute value is odd. Floats should only return true if the
# number is equal to its integer part and the integer is odd.
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd?(number)
  (number.abs % 2 != 0) && (number.to_i == number) # better is: number % 2 == 1
end
    


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true

#JavaScript version does require you to transform to absolute value since it's the remainder rather than modulo operator.

# function isOdd(number) {
#   console.log(Math.abs(number) % 2 === 1)
# }

# isOdd(2);
# isOdd(5);
# isOdd(-17);
# isOdd(-8);
# isOdd(-7.1);
# isOdd(-5.0);
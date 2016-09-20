# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat_yourself(string, integer)
  integer.times {p string}
end

repeat_yourself('Hello my friend!', 4)

# JavaScript example.

# function repeatYourself(string, integer) {
#   for (var i= 0; i < integer; i++) {
#     console.log(string)
#   }
# }

# repeatYourself('Hello my friend!', 4);
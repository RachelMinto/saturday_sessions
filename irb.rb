  NUMBERS = {'0' => " _\n| |\n|_|\n", '1' => "\n  |\n  |\n", 
             '2' => " _\n _|\n|_\n", '3' => " _\n _|\n _|\n",
             '4' => "\n|_|\n  |\n", '5' => " _\n|_\n _|\n",
             '6' => " _\n|_\n|_|\n", '7' => " _\n  |\n  |\n",
             '8' => " _\n|_|\n|_|\n", '9' => " _\n|_|\n _|\n"}

  # def convert(text)
  #   number_code = num_array(text)
  #   NUMBERS.
  # end

  def find_num_array(text)
    num_array = []
    text.split('').each do | character |
      # character == " " ? num_array.push(0) : num_array.push(1)
      num_array << character
    end
    num_array
  end

  p find_num_array(text)

"    _  || |  ||_|"
"  |  | _| ||_|"
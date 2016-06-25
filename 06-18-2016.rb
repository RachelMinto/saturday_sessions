
def translate(string)
  new_string = ""
  string.split("").each do |char|
    if %w(a e i o u).include? char
      new_string << char
    elsif ('a'..'z').to_a.include? char
      new_string << (char + 'o' + char)
    else
      new_string << char
    end
  end
  new_string
end

p translate("Hi I am Rachel.")
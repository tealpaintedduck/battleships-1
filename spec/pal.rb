# def pal? str
#   str = str.downcase.gsub(/\W+/,"")
#   if str.length == 1 || (str.length == 2 && str[0] == str [1])
#     puts 'Pal!'
#   elsif str[0] == str[-1]
#     pal? str[1..-2]
#   else
#     puts "No pal."
#   end
# end

def pal? str
  str = str.downcase.gsub(/\W+/,"")
  if str.length == 1 || (str.length == 2 && str[0] == str [1])
    true
  elsif str[0] == str[-1]
    pal? str[1..-2]
  else
    false
  end
end

puts pal? "245423"
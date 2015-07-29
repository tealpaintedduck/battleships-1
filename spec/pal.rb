# def pal string
#   puts string
#  # str = string.downcase
#   str = string.gsub(" .,!;:","")
#   exit if str[0] != str[-1]
#   str = str[1..-2]
#   pal str
#   true
# end




def pal string
  puts string
  string.downcase!
  string = string.gsub!(/\W+/,"")
  puts string
  exit if string.length < 2 || string[0] != string[1..-1]
  string = string[1..-2]
  pal string
end

puts pal "Afjdilskjfa"
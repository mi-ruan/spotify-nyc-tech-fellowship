# Question 1 -- sortByStrings(s,t): Sort the letters in the string s by
# the order they occur in the string t. You can assume t will not have
# repetitive characters. For s = "weather" and t = "therapyw", the output
# should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg",
# the output should be sortByString(s, t) = "oodg"

def sortByStrings(s,t)
  s.chars.sort_by {|el| t.index(el)}.join("")
end

# s = "good"
# t = "odg"
#
# puts sortByStrings(s,t)

# Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.

# The encoding rule is: k[encoded_string], where the encoded_string
# inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.

# For s = "4[ab]", the output should be decodeString(s) = "abababab"
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

def decodeString(s)
  curr = ""
  num = 1
  iter = s.count("[")
  (0...iter).each do |i|
    close_paren_index = s.index("]")
    open_paren_index = 1
    close_paren_index.downto(0).each do |idx|
      if s[idx] == "["
        open_paren_index = idx
        break
      end
    end
    num = s[open_paren_index - 1]
    curr = s[open_paren_index + 1...close_paren_index]
    s.slice!(open_paren_index - 1, close_paren_index - (open_paren_index - 2))
    s.insert(open_paren_index-1, curr * num.to_i)
  end
  s
end

# s = "2[b3[a]]"
#
# puts decodeString(s)

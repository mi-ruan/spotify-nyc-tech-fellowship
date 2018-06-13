# Question 3 -- changePossibilities(amount,amount): Your quirky boss
# collects rare, old coins. They found out you're a programmer and asked
# you to solve something they've been wondering for a long time.

# Write a function that, given an amount of money and an array of coin
# denominations, computes the number of ways to make the amount of money
# with coins of the available denominations.

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢),
# your program would output 4—the number of ways to make 4¢ with those denominations:

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

def changePossibilities(amount, denom)
  table = Array.new(amount + 1) {Array.new(1)}
  (1..amount).each do |el|
    denom.include?(el) ? table[el] = [el] : table[el] = []
    denom.each do |coin|
      if el - coin > 0
        table[el - coin].each do |comb|
          if comb.is_a? Array
            new_comb = comb.dup
            new_comb = new_comb.concat([coin]).sort
          else
            new_comb = [comb].concat([coin]).sort
          end
          table[el].push(new_comb) unless table[el].include?(new_comb)
        end
      end
    end
  end
  table.last.size
end

# amount = gets.chomp.to_i
# denom = [1,2,3]
#
# puts changePossibilities(amount, denom)

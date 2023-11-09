def first_anagram?(str1, str2)
  str1.chars.permutation.map(&:join).include?(str2)
end
# time complexity: O(n!)
# space complexity: O(n!)
# that is because we need n! permutations

p first_anagram?('gizmo', 'sally')    #=> false
p first_anagram?('elvis', 'lives')    #=> true

def second_anagram?(str1, str2)
  str1.each_char do |char| # n(lines 13-4) == n(n+n+1) == n(2n) == n^2
    idx =  str2.index(char) # n
    return false if idx.nil? # 1

    str2.slice!(idx) # O(n)
  end
  str2.empty? # 1
end

# time complexity: O(n^2)
# splace complexity: probably O(1)

p second_anagram?('gizmo', 'sally')    #=> false
p second_anagram?('elvis', 'lives')    #=> true

def third_anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join # O(nlog) sort is O(nlog n)
end

# time complexity: O(n log n)
# space complexity: O(n), String#chars allocates data of n elements

p third_anagram?('gizmo', 'sally')    #=> false
p third_anagram?('elvis', 'lives')    #=> true

def fourth_anagram?(str1, str2)
  str1.chars.tally == str2.chars.tally # each step is O(n)
end

# time complexity: O(n)
# space complexity: O(n), chars and tally create data structures with n elements
# it would be O(1) if we used each_char instead of chars and the hash is always constant space,
# becuse the hash will have at most 26 keys ('a'..'z'). hashes have no duplicate keys

p fourth_anagram?('gizmo', 'sally')    #=> false
p fourth_anagram?('elvis', 'lives')    #=> true

def bonus_anagram?(str1, str2)
  return false if str1.length != str2.length # 1

  str1_hash = str1.each_char.tally # O(n)

  str2.each_char do |char| # O(n)
    return false if str1_hash[char] in nil | 0 # str1_hash == nil || str1_hash == 0

    str1_hash[char] -= 1
  end
  true
end

# time complexity: O(n)
# space complexity: O(1). the hash has at most 26 keys, String#each_char is constant space complexity compared to
# String#chars, which is O(n) space complexity.

p bonus_anagram?('gizmo', 'sally')    #=> false
p bonus_anagram?('elvis', 'lives')    #=> true

def first_anagram?(str1, str2)
    str1.chars.permutation.map(&:join).include?(str2)
end
# time complexity: O(n!)


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |char| #O(n)
       idx =  str2.index(char)  #1
       return false if idx.nil? # n
       str2.slice!(idx) #O(n)
    end
    return str2.empty? #1
end

#time complexity: O(n)

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    str1.chars.sort.join == str2.chars.sort.join # O(nlog) sort is O(nlog n)

end

#time complexity: O(n log n)

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    str1.chars.tally == str2.chars.tally #each step is O(n)
end

#time complexity: O(n)


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

def bonus_anagram?(str1, str2)
    return false if str1.length != str2.length # 1
    str1_hash = str1.chars.tally  # O(n)
    
    str2.each_char do |char| # O(n)
  
        return false if str1_hash[char] in nil | 0 #str1_hash == nil || str1_hash == 0
        str1_hash[char] -= 1     
    end
    return true

end

#time complexity: O(n)

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
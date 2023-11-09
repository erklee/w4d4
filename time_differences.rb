# frozen_string_literal: true

# time complexity: O(n^2)
def my_min_slow(array)
  array.each do |min|
    # array.all?{|element| min > element}
    is_minimum = true
    array.each do |element|
      is_minimum = false if min > element
    end
    return min if is_minimum
  end
end

# time complexity: O(n)
def my_min_fast(array)
  min = array.first
  array[1..].each do |element|
    min = element if element < min
  end
  min
end

list = [0, 3, 5, 4, -5, 10, 1, 90]
p my_min_slow(list) == -5
p my_min_fast(list) == -5

# time complexity: O(n^3)
def largest_contiguous_subsum_slow(array)
  subarrs = [] # 1
  array.each_with_index do |_, idx_start| # n (n^2) => n^3
    array.each_with_index do |_, idx_end| # n (n) => n^2
      next if idx_end < idx_start # 1

      subarrs << array[idx_start..idx_end] # n
    end
  end
  subarrs.map(&:sum).max # subarrs.map(&:sum) is O(n), .max is O(n) the line in total is O(n + n), which is O(2n)
  # which is O(n)
end

list = [5, 3, -7]
p largest_contiguous_subsum_slow(list) == 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_slow(list) == 8 #  (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum_slow(list) == -1 #  (from [-1])

def largest_contiguous_subsum_fast(array)
  # kadane help us!
end

list = [5, 3, -7]
p largest_contiguous_subsum_fast(list) == 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_fast(list) == 8 #  (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum_fast(list) == -1 #  (from [-1])

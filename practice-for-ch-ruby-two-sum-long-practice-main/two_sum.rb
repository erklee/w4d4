# frozen_string_literal: true

# time complexity: O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.combination(2).map(&:sum).include?(target_sum)
end

# #combination sorta looks like:
# arr.eachwindx |e;e, idx1|
#  arr.eachw-idx |ele2,idx2|
#     [ele1, ele2].sum==target ?
# with two loops, so it's O(n^2)

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) == true
p bad_two_sum?(arr, 10) == false


def two_sum?(arr, target_sum)
  idx_start = 0
  idx_end = arr.length - 1

  
end

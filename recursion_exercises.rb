def range_recursion(start, last)
  if last < start
    return []
  end
  return [] if start == last
  [start].concat(range_recursion(start+1, last))
end

def range_iteration(start, last)
  res_arr = []
  (start...last).each do |num|
    res_arr << num
  end
  res_arr
end

# p range_recursion(1,5)
# p range_iteration(1,5)

def exponent_v1(b, n)
  return 1 if n == 0
  b * exponent_v1(b,n-1)
end

# p exponent_v1(3, 0)
# p exponent_v1(3, 1)
# p exponent_v1(3, 2)
# p exponent_v1(3, 3)

def exponent_v2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exponent_v2(b, n / 2) ** 2
  else
    b * (exponent_v2(b, (n - 1) / 2) ** 2)
  end
end

# p exponent_v2(2, 0)
# p exponent_v2(2, 1)
# p exponent_v2(2, 2)
# p exponent_v2(2, 3)
# p exponent_v2(2, 4)
# p exponent_v2(2, 5)


def deep_dup(array)
    return array.dup if array.empty?

    array.map do |ele|
        if ele.is_a?(Array) 
            deep_dup(ele)
        else
            ele
        end
    end
end


robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

deep_dup(robot_parts)


# arr1 = []
# arr2 = [1]
# arr3 = [1,2]

# y = [2]
# arr4 = [1,y]

# y = deep_dup(arr1)
# deep_dup(arr2)
# deep_dup(arr3)
# q = deep_dup(arr4)


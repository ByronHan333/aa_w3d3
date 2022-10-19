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

def fib(n)
  return [0] if n == 1
  return [0,1] if n == 2
  fib_arr = fib(n-1)
  sum = fib_arr[-1]+fib_arr[-2]
  fib_arr << sum
end

# p fib(1)
# p fib(3)
# p fib(4)
# p fib(5)
# p fib(8)

def bsearch(array, target)
  mid_idx = array.length / 2
  mid_ele = array[mid_idx]
  # print "#{mid_ele}\n"
  return mid_idx if mid_ele == target
  if mid_ele > target
    partition = array[0...mid_idx]
    # return mid_idx - bsearch(partition, target)
    return bsearch(partition, target)

  else
    partition = array[mid_idx..-1]
    return mid_idx + bsearch(partition, target)
    # return bsearch(partition, target)
  end

end

# array = [0,1,2,3,4,5]
# p bsearch(array, 0)
# p bsearch(array, 1)
# p bsearch(array, 2)
# p bsearch(array, 3)
# p bsearch(array, 4)
# p bsearch(array, 5)

def method_name
  
end

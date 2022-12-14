# Extra Recursion Practice Problems

# Problem 1: `recursive_sum`
#
# Write a method, `recursive_sum`, that receives an array and uses recursion
# to add up all the integers in a given array.

def recursive_sum(array)
  return 0 if array.length == 0
  array[0] + recursive_sum(array[1..-1])
end

# Problem 2: `reverse_string`
#
# Write a method, `reverse_string`, that takes in a string and returns the
# string with the characters in reverse order. You must use a recursive solution
# to solve this problem.

def reverse_string(str)
  return "" if str.empty?
  return str if str.length == 1
  reverse_string(str[1..-1]) + str[0]
end

# Problem 3: `sorted?`
#
# Write a method, `sorted?`, that takes in an array and returns a boolean
# indicating whether the array is sorted (in ascending order). You must use a
# recursive approach to solve this problem. Do not use the built-in `sort`
# method.

def sorted?(array)
  return true if array.empty? || array.length == 1
  array[0] <= array[1] && sorted?(array[1..-1])
end

# Problem 4: `update_order_total`
#
# Write a method, `update_order_total`, that takes an existing order `total`
# and adjusts it based on an `updates` array of hashes where each hash contains
# a `name`, `price`, and `status`. Based on the status, each item's price should
# either be added or removed from the running order total. (Any status besides
# `add` or `remove` should be ignored.) Write a recursive solution to solve this
# problem.
#
# Sample update:
# updates = [
#     { name: "Lettuce", price: 3.57, status: "add" },
#     { name: "Avacado", price: 0.99, status: "remove" },
#     { name: "Salmon", price: 15.99, status: nil }
# ]



def update_order_total(total, updates)
  return total if updates.empty?
  order_0 = updates[0]

  change = -order_0[:price] if order_0[:status] == "remove"
  change = order_0[:price] if order_0[:status] == "add"
  change = 0 if order_0[:status] == nil

  change + update_order_total(total, updates[1..-1])
end


# Problem 5: Refactor an iterative solution into a recursive solution
#
# Use recursion to refactor this iterative solution. First read the
# `iterative_solution` method and analyze what is happening. Then write the
# method `recursive_solution` to accomplish the same result using recursion
# instead of iteration. When complete, `recursive_solution(data)` should return
# the exact same result as `iterative_solution(data)`.

def iterative_solution(data) # DO NOT MODIFY THIS METHOD
  by_completion = { complete: [], incomplete: [] }
  data.each do |person|
    if person[:isComplete]
      by_completion[:complete] << person[:name]
    else
      by_completion[:incomplete] << person[:name]
    end
  end
  by_completion
end

def recursive_solution(data)
  if data.length == 1
    if data[0][:isComplete]
      return  { complete: [data[0][:name]], incomplete: [] }
    else
      return  { complete: [], incomplete: [data[0][:name]] }
    end
  end

  hash = recursive_solution(data[0..-2])
  person = data[-1]

  if person[:isComplete]
    hash[:complete] << person[:name]
  else
    hash[:incomplete] << person[:name]
  end
  hash
end

# Your code here

# Problem 6: Debug a Recursive Solution
#
# `palindrome?` is a recursive method that returns a boolean to indicate
# whether or not the given `string` is a valid palindrome. At least, that is
# what it is supposed to do. Unfortunately, it doesn't work at the moment, and
# the programmer has asked you to help debug it.
#
# Look carefully at the test cases to determine any edge cases that must be
# accounted for. You can also use `byebug` with debuggers, `p` statements, or
# both to analyze the current behavior of the method and/or any confusing
# parts of the code (such as the regular expression passed as the first argument
# to `gsub`). When you are finished debugging, all test cases should pass.
#
# Note: The `gsub` call is not a problem.

def palindrome?(string)
  return true if string.empty?

  cleanedString = string.gsub(/ |,/, "").downcase
  if cleanedString[0] == cleanedString[-1]
    return palindrome?(cleanedString[1..-2])
  end
  false
end

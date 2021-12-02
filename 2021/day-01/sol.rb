# frozen_string_literal: true

def sum(nums)
  nums.reduce(:+)
end

def solve_1(nums)
  count = 0
  prev = 0
  nums.each do |num|
    count += 1 if num > prev
    prev = num
  end
  count - 1 # first one is not the increment
end

def solve_2(nums)
  sums = []

  (0..(nums.length - 3)).each do |i|
    sums.push(sum(nums.slice(i, 3)))
  end

  solve_1 sums
end

def main
  input = File.read './input.text'
  nums = input.split("\n").map(&:to_i)
  result = solve_2 nums
  print(result)
end

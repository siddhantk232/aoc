# store lines in content until numbered lines found
lines = File.read("input.txt").lines

contents = []

lines.each do |line|
  if line[1] in ("1".."10")
    break
  end
  contents.push(line)
end

lines = lines - contents

# find the number of stacks
stack_count = lines[0][-3].to_i
lines.shift
lines.shift

# create an array of stacks
stacks = []

puts contents
(1..stack_count).to_a.each do |x|
  stack = []
end

# fill those stacks from contents
# parse rearrangement procedure
# follow rearrangement procedure
# puts top of each stack

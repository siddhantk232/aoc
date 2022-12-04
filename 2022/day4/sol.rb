file = File.open("input.txt")

text = file.read()
file.close()

pairs = text.split("\n").map do |x|
  x.split(",")
end

ans  = 0
ans2 = 0;

pairs.each do |pair|
  lpair = pair[0].split("-").map{|x| x.to_i}
  rpair = pair[1].split("-").map{|x| x.to_i}
  pnum = lpair + rpair

  if (pnum[0] <= pnum[2] and pnum[3] <= pnum[1]) or (pnum[2] <= pnum[0] and pnum[1] <= pnum[3])
    ans += 1
  end

  if (pnum[1] >= pnum[2] and pnum[3] >= pnum[1]) or (pnum[3] >= pnum[0] and pnum[3] <= pnum[1])
    ans2 += 1
  end
end

puts ans
puts ans2

a = [1, 2, 3, 4, 5, 6, 7, 8]
a.each {|x| puts x if x > 5}

print a.select {|x| x%2==1}
puts ""
print a.select {|x| x.odd?}
puts ""

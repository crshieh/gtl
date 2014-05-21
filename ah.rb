#this prints out a list vertically, one number each line
a=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#a.each {|x| puts x}

#this prints out a list in a row like 12345678910
#a=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#a.each {|x| print x}

#this is what I like:
#a=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#a.each {|x| print x, ", "}

#this one looks weird, commas have their own lines too
#a=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#a.each {|x| puts x, ", "}

#if array is bigger than...
#only works with puts, not with print
#a=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#a.each {|biggie| puts biggie if biggie > 5}

#picking odd
print a.select {|x| x%2==1}
puts ""
print a.select {|x| x.odd?}
puts ""

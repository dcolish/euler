l = [0,1]
total = 0

def fib(l,x, y):
	new = l[x] + l[y]
	l.append(new)
	x+=1
	y+=1
	return l, x , y


for total, x, y in fib(l,0,1):
	total += total

print total

import math


nums = [(a, b, math.sqrt(a**2 + b**2)) for a in range(1, 425) for b in range(1, a)]

def do_stuff(p):
    res = 0
    for a, b, c in nums:
        if a + b + c == p:
            res += 1
    return res

ans = 0
perim = 0
for x in range(1, 1000):
    tmp = do_stuff(x)
    if ans < tmp:
        ans = tmp
        perim = x

print perim
print ans

import operator
from itertools import izip
from pprint import pprint


def zip_with(op, r1, r2):
    return [op(*i) for i in izip(r1, r2)]


def pascal(row_limit):
    row = [1]
    rows = [row]
    for _ in range(0, row_limit):
        row = zip_with(operator.add, [0] + row, row + [0])
        rows.append(row)
    return rows

pprint(pascal(40)[40][20])

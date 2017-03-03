
def distance(a, b):
    def compare(i):
        return int(a[i] != b[i])

    return sum(map(compare, range(0, len(a))))

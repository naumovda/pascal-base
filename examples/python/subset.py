def subsets(source):
    open_list = [source]
    close_list = []
    while open_list != []:
        item = open_list.pop()
        if not item in close_list:
            close_list.append(item)
            for elem in list(item):
                new_set = item.copy()
                new_set.remove(elem)
                if not new_set in open_list:
                    open_list.append(new_set)
    return close_list

n = 4
s = set([item for item in range(1, n+1)])

print(subsets(s))
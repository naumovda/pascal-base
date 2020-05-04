def draw_walls(walls):
    for level in range(max(walls), 0, -1):
        level_descr = ''
        for wall in walls:
            if wall >= level:
                level_descr += '|X|'
            else:
                level_descr += '   '
        print(level_descr)
    print()        

def draw_walls_with_water(walls, waters):
    for level in range(max(walls), 0, -1):
        level_descr = ''
        for wall, water in zip(walls, waters):
            if level <= wall:
                level_descr += '|X|'
            elif level <= water+wall:
                level_descr += '~~~'
            else:
                level_descr += '   '
        print(level_descr)
    print()

def calc_water(walls):
    high_left = [0]
    high_right = [0]
    for i in range(1, len(walls)):
        high_left.append(max(walls[i-1], high_left[i-1]))
        high_right.insert(0, max(walls[len(walls)-i], high_right[0]))
    return [max(min(high_left[i], high_right[i]) - walls[i], 0) for i in range(0, len(walls))]

walls = [2, 5, 1, 2, 3, 4, 7, 7, 6, 4, 1, 2]
water = calc_water(walls)

print('source data:')
draw_walls(walls)

print('result:')
draw_walls_with_water(walls, water)

print('water volume:', sum(water))

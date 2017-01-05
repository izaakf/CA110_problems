##Pathfinder
import random

def create_table(columns, rows):
    PossibleInts = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0]
    table = []
    for y in range(rows):
        table.append([])
        for x in range(columns):
            table[y].append(random.choice(PossibleInts)),
    table[0][0] = 1
    table[3][3] = 1
    return table

def NumberOfPaths(table):
    for i in range(4):
        print('\n')
        for a in range(4):
            print(table[i][a], end="")
    print('\n')
    x, y = 0, 0
    if table[y][x+1] == 1:
        x += 1
        print(x, y)
    elif table[y+1] == 1:
        y += 1
        print(x, y)
    else:
        print('There is no solution for this maze')



table = create_table(4,4)
NumberOfPaths(table)
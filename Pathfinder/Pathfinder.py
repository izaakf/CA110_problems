import random

def create_table(rows,columns):
    PossibleInts = [1]
    global table
    table = []
    for y in range(rows):
        table.append([])
        for x in range(columns):
            table.append(random.choice(PossibleInts)),
    return table


def NumberOfPaths(table):
    print(table)
    x = 0
    y = 0
    i = 0
    while i < len(table):
        if Tabless[x+1] == 1:
            x += 1
            print('table x', table[x])

        elif table[y+3] == 1:
            y += 3
            print('table y', table[y])
        i += 1
    if len(table)-3 == x*y:
        print(x+y/3)

    print(table[x], 'x pos')

table = create_table(3, 3)
NumberOfPaths(table)

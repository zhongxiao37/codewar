def street_fighter_selection(fighters, initial_position, moves):
    moves_dict = {'left': (0, -1), 'right': (0, 1), 'up': (-1, 0), 'down': (1, 0)}
    pos = list(initial_position)
    selected_characters = []
    for move in moves:
        if pos[0] == 0 and move == 'up':
            # do nothing
            print('')

        elif pos[0] == 1 and move == 'down':
            # do nothing
            print('')

        else:
            direction = moves_dict[move]
            pos[0] += direction[0]
            pos[1] += direction[1]
            pos = [i + 6 if i < 0 else i for i in pos]

        selected_characters.append(fighters[pos[0]][pos[1]])

    return selected_characters 


fighters = [
    ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
    ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
]
opts = ["up","down","right","left"]
moves =  ["left"]*8
solution = ['Vega', 'Balrog', 'Guile', 'Blanka', 'E.Honda', 'Ryu', 'Vega', 'Balrog']
print(street_fighter_selection(fighters,(0,0), moves))
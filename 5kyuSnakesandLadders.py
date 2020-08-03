class SnakesLadders():

    trans = { 2: 38, 7: 14, 8: 31, 15: 26, 28: 84, 21: 42, 36: 44, 51: 67, 78: 98, 87: 94, 71: 91, 16: 6, 46: 25, 49: 11, 62: 19, 64: 60, 74: 53, 89: 68, 92: 88, 95: 75, 99: 80 }

    def __init__(self):
        self.slots = [0, 0]
        self.player = 0
        self.game_over = False

    def play(self, die1, die2):
        if self.game_over:
            return 'Game over!'
        self.slots[self.player] += sum([die1, die2])
        if self.slots[self.player] == 100:
            self.game_over = True
            return 'Player {} Wins!'.format(self.player + 1)
        if self.slots[self.player] > 100:
            self.slots[self.player] = 100 - (self.slots[self.player] - 100)
        if self.slots[self.player] in self.trans.keys():
            self.slots[self.player] = self.trans[self.slots[self.player]]

        fmt = 'Player {} is on square {}'
        msg = fmt.format(self.player + 1, self.slots[self.player])
        
        if die1 != die2:
            self.player = self.player ^ 1

        return msg
        

game = SnakesLadders()
print(game.play(1, 1))
print(game.play(1, 5))
print(game.play(6, 2))
print(game.play(1, 1))
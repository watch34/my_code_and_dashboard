import random
def play_rps():
    txt = "Hi Welcome to play RPS !!!"
    x = txt.title().upper()
    print(x)
    actions = ["rock", "paper", "scissors", "quit"]
    win = 0
    tie = 0
    lose = 0
    while True:
        #input
        bot_hands = random.choice(actions[0:3])
        user_actions = input("play game >> your choose : rock, paper, scissors or quit: ").lower()
        

        ##case quit
        if user_actions == "quit":   
            print("--Thank You >> Good Luck!!--")
            break
        elif user_actions == "rock" and bot_hands == "scissors":
            print("--You Win! : Good job--")
            win += 1
        elif user_actions == "paper" and bot_hands == "rock":
            print("--You Win! : Good job--")
            win += 1
        elif user_actions == "scissors" and bot_hands == "paper":
            print("--You Win! : Good job--")
            win += 1 
        elif user_actions == bot_hands:
            print("--You Tie! Please try agian--")
            tie += 1
        elif user_actions == "rock" and bot_hands == "paper":
            print("--You Lose : Please try agian--")
            lose += 1
        elif user_actions == "paper" and bot_hands == "scissors":
            print("--You Lose : Please try agian--")
            lose += 1
        elif user_actions == "scissors" and bot_hands == "rock":
            print("--You Lose : Please try agian--")
            lose += 1
        else:
            print("--Invalid : Please try agian--")
 
    print(f"You Score : Win: {win} Tie: {tie} Lose: {lose}")

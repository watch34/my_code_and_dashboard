#Game เป่ายิ้งฉุบ

play_game <- function () {
  actions <- c("rock", "paper", "scissors", "quit")
  count_win <- 0         ##นับครั้งเฉพาะที่ชนะ
  count_tie <- 0         ##นับครั้งเฉพาะที่เสมอ
  count_loss <- 0        ##นับครั้งเฉพาะที่เสมอ


## conditions game

    while (TRUE) {
      ## input
      player_action <- readline("Play Game >> Your Choose : Rock, Paper, Scissors or Quit: ")
      
      if (player_action == "quit"){
          print ("--Thank You >> Good Bye!!--")
        break
      }
        player_action <- player_action
        computer_hands <- sample(actions , size = 1, TRUE)
      
      if(player_action %in% actions)
        if(player_action == computer_hands){   ##case tie                       
        count_tie <- count_tie + 1
        print ("--You Tie! Please try agian--", "\n")
        
      } else if ((player_action == "rock" & computer_hands == "scissors") ## case win
                 |player_action == "paper" & computer_hands == "rock"
                 |player_action == "scissors" & computer_hands == "paper") {
                  count_win <- count_win + 1
                  print ("--You Win! : Good job--", "\n")
      } else {
            count_loss <- count_loss + 1
            print ("--You Loss : Please try agian--", "\n")
      }
    }       
 
  print ("play_action: ", player_acion, "\n")
  print ("com_action: ", computer_hand, "\n" )
  print (count_win, count_tie, count_loss)

}

#create table summary
summary_point <- data.frame(round_id = round_count,
                            count_win,
                            count_tie,
                            count_loss,
                            sum_win_point,
                            sum_tie_point,
                            sum_loss_point)

# Plot Function
BB_plot <- function(data, rows=1:10){
  Data <- data[rows,,drop=FALSE]
  matplot(t(Data),type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

# Free Throw Attempts per Game
BB_plot(FreeThrowAttempts/Games)
FreeThrowAttempts
Games
FreeThrowAttempts/Games

# Accuracy of Free Throws
BB_plot(FreeThrows*100/FreeThrowAttempts)
FreeThrows
FreeThrowAttempts
FreeThrows*100/FreeThrowAttempts

# Player Playing Style (2v3 pts preference) excl. FT
BB_plot((Points-FreeThrows)/FieldGoals)
Points
FreeThrows
FieldGoals
(Points-FreeThrows)/FieldGoals
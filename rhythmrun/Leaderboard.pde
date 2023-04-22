// used to save the information of the leaderboard score
class LeaderboardScore {
  Integer rank;
  Integer score;
  String dateTime;
  
  public LeaderboardScore() {}
  // creates the leaderboard score with the rank,score, and date
  public LeaderboardScore(Integer rank, Integer score, String dateTime) {
    this.rank = rank;
    this.score = score;
    this.dateTime = dateTime;
  }
}

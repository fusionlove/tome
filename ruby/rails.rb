"use this in the controller to ensure the right DB is connected to"

  before_filter Proc.new {
    ScoredFling.establish_connection "user_scoring_development".to_sym
  }

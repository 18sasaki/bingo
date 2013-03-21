module ApplicationHelper
  def twitter_view(game_id)
    game = Game.find(game_id)
    game.total != 0
  end
end

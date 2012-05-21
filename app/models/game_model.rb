module MagicField
  class Game

    def initialize
      @players = []
    end

    def addPlayer(player)
      @players << player
      player.position = @players.length
    end

  end
end
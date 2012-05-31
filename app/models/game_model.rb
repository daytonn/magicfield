module MagicField
  class Game

    attr_accessor :p1, :p2

    def initialize(p1, p2)
      @p1 = MagicField::Player.new(1, p1)
      @p2 = MagicField::Player.new(2, p2)
    end

  end
end
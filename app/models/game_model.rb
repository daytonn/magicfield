module MagicField
  class Game

    attr_accessor :p1, :p2

    @@starting_life = 20
    @@max_poison = 10

    def self.starting_life
      @@starting_life
    end

    def self.max_poison
      @@max_poison
    end

    def initialize(p1, p2)
      @p1 = MagicField::Player.new(1, p1)
      @p2 = MagicField::Player.new(2, p2)
    end

  end
end
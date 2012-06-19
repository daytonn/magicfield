module MagicField
  class Player

    attr_accessor :position, :name, :life, :poison, :starting_life

    def initialize(position, name)
      @position = position
      @name = name
      @life = MagicField::Game::starting_life
      @poison = 0
    end

    def decrementLife(n = 1)
      @life -= n
      @life = 0 if @life < 0
      self
    end

    def incrementLife(n = 1)
      @life += n
      self
    end

    def incrementPoison(n = 1)
      @poison += n
      @poison = 10 if @poison > 10
      @life = 0 if @poison === 10
      self
    end

    def decrementPoison(n = 1)
      @poison -= n
      @poison = 0 if @poison < 0
      self
    end

    def isFirst?
      @position === 1
    end

    def dead?
      @life === 0
    end

  end
end
module MagicField
  class Player

    attr_accessor :position, :name, :life, :poision

    def initialize(position, name)
      @position = position
      @name = name
      @life = 20
      @poision = 0
      #@mana = MagicField::PlayerMana.new
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

    def incrementPoision(n = 1)
      @poision += n
      @poision = 10 if @poision > 10
      @life = 0 if @poision === 10
      self
    end

    def decrementPoision(n = 1)
      @poision -= n
      @poision = 0 if @poision < 0
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
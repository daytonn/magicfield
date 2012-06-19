module MagicField
  class ManaButton

    attr_accessor :button

    def initialize(color)
      @value = 'off'
      @color = color
      @button = UIView.alloc.initWithFrame [[0, 0], [44, 45]]
      @bgEmpty = UIImage.imageNamed("#{@color.downcase}-mana-empty.png")
      @bgFull = UIImage.imageNamed("#{@color.downcase}-mana-full.png")

      @bgFullView = UIImageView.alloc.initWithImage @bgFull
      @bgEmptyView = UIImageView.alloc.initWithImage @bgEmpty

      @bgFullView.alpha = 0.0
      @bgEmptyView.alpha = 100.0

      @button.addSubview @bgEmptyView
      @button.addSubview @bgFullView

      registerEvents
    end

    def registerEvents
      @button.whenTapped do
        switch
      end
    end

    def on?
      @value === 'on'
    end

    def off?
      @value === 'off'
    end

    def switch(to = nil)
      if to
        @value = to
      else
        @value = @value === 'on' ? 'off' : 'on'
      end

      setButtonImage
    end

    def setButtonImage
      if on?
        @bgFullView.alpha = 100.0
      else
        @bgFullView.alpha = 0.0
      end
    end

  end
end
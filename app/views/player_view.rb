class PlayerView

  attr_reader :view

  def initialize(player)
    @player = player
    setupView
  end

  def setupView
    initializeView
    addBackground
    createLabels
    addProgressBars
  end

  def takeHit
    unless @player.dead?
      @player.decrementLife
      @life_label.text = "Life: #{@player.life}"
      updateLifeBar
      killPlayer if @player.dead?
    end
  end

  private
    def initializeView
      viewDimensions = [764, 484]
      offset = {
        left: 2,
        top: @player.isFirst? ? 475 : 0
      }
      viewOffset = [offset[:left], offset[:top]]
      @view = UIView.alloc.initWithFrame([viewOffset, viewDimensions])
      @view.transform = CGAffineTransformMakeRotation(Math::PI) unless @player.isFirst?
      @view.userInteractionEnabled = true
      @view.whenSwiped do
        takeHit
      end
    end

    def addBackground
      bg = UIImageView.alloc.initWithImage UIImage.imageNamed('decorative-box.png')
      @view.addSubview(bg)
    end

    def createLabels
      @name_label = createLabel(@player.name, {
        font: "Booter - Five Zero",
        fontSize: 80,
        color: UIColor.whiteColor,
        shadow: true,
        offset: [70, 50]
      })
      @life_label = createLabel("Life: #{@player.life}", {
        font: "Booter - Five Zero",
        fontSize: 32,
        color: UIColor.whiteColor,
        shadow: true,
          offset: [550, 70]
      })
      @poision_label = createLabel("Poision: #{@player.poision}", {
        font: "Booter - Five Zero",
        fontSize: 32,
        color: UIColor.whiteColor,
        shadow: true,
          offset: [550, 95]
      })
      @view.addSubview(@name_label)
      @view.addSubview(@life_label)
      @view.addSubview(@poision_label)
    end

    def addProgressBars
      @life_bar = UIProgressView.alloc.initWithFrame([[70, 140], [580, 0]])
      @life_bar.progressTintColor = UIColor.redColor
      updateLifeBar
      @view.addSubview(@life_bar)

      @poision_bar = UIProgressView.alloc.initWithFrame([[70, 160], [580, 0]])
      @poision_bar.progressTintColor = UIColor.greenColor
      updatePoisionBar
      @view.addSubview(@poision_bar)
    end

    def updateLifeBar
      @life_bar.setProgress(@player.life / 20.00, animated: true)
    end

    def updatePoisionBar
      @poision_bar.setProgress(@player.poision / 10.00, animated: true)
    end

    def killPlayer
      backgroundImage = UIImageView.alloc.initWithImage UIImage.imageNamed('blood-splatter.png')
      @view.addSubview backgroundImage
    end

end
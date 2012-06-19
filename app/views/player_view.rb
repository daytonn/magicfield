class PlayerView

  attr_reader :view

  def initialize(player)
    @player = player
    @labelFontWeight = 80
    @fontSettings = {
      font: "Booter - Five Zero",
      fontSize: @labelFontWeight,
      color: UIColor.whiteColor,
      shadow: true
    }
    setupView
  end

  def setupView
    initializeView
    drawBackground

    drawNameLabel
    drawLifeLabel
    drawPoisonLabel
    drawLifeBar
    createHeartIcon
    createPoisonIcon
    registerEvents
    updateView
  end

  private
    def initializeView
      viewDimensions = [764, 484]
      offset = {
        left: 2,
        top: @player.isFirst? ? 475 : 0
      }
      viewOffset = [offset[:left], offset[:top]]
      @viewFrame = [viewOffset, viewDimensions]
      @view = UIView.alloc.initWithFrame(@viewFrame)
      @view.transform = CGAffineTransformMakeRotation(Math::PI) unless @player.isFirst?
      @view.userInteractionEnabled = true
    end

    def registerEvents
      @view.whenSwiped do
        unless @player.dead?
          @player.decrementLife
          updateView
        end
      end

      @heartIconView.whenTapped do
        unless @player.dead?
          @player.incrementLife
          updateView
        end
      end

      @poisonIconView.whenTapped do
        unless @player.dead?
          @player.incrementPoison
          updateView
        end
      end
    end

    def drawBackground
      bg = UIImageView.alloc.initWithImage UIImage.imageNamed('decorative-box.png')
      @view.addSubview(bg)
    end

    def drawNameLabel
      @nameLabel = createLabel(@player.name, @fontSettings.merge({ offset: [70, 50] }))
      @view.addSubview @nameLabel
    end

    def drawLifeLabel
      @lifeLabel = createLabel("#{@player.life}", @fontSettings.merge({ offset: [530, 58] }))
      @view.addSubview @lifeLabel
    end

    def drawPoisonLabel
      @poisonLabel = createLabel("#{@player.poison}", @fontSettings.merge({ offset: [655, 58] }))
      @view.addSubview @poisonLabel
    end

    def drawLifeBar
      @lifeBar = UIProgressView.alloc.initWithFrame [ [70, 140], [620, 0] ]
      @lifeBar.progressViewStyle = UIProgressViewStyleBar
      @lifeBar.progressTintColor = UIColor.redColor
      @view.addSubview @lifeBar
    end

    def createHeartIcon
      @heartIconView = UIView.alloc.initWithFrame [ [480, 70], [50, 50] ]
      heartBottle = UIImageView.alloc.initWithImage UIImage.imageNamed('health.png')
      @heartIconView.addSubview heartBottle
      @view.addSubview @heartIconView
    end

    def createPoisonIcon
      @poisonIconView = UIView.alloc.initWithFrame [ [610, 70], [50, 50] ]
      poisonBottle = UIImageView.alloc.initWithImage UIImage.imageNamed('poison.png')
      @poisonIconView.addSubview poisonBottle
      @view.addSubview @poisonIconView
    end

    def killPlayer
      backgroundImage = UIImageView.alloc.initWithImage UIImage.imageNamed('blood-splatter.png')
      @view.addSubview backgroundImage
    end

    def updateView
      @lifeLabel.text = "#{@player.life}"
      @poisonLabel.text = "#{@player.poison}"
      @lifeBar.setProgress(@player.life / 20.00, animated: true)
      killPlayer if @player.dead?
    end

end
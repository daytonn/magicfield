class MagicFieldViewController < UIViewController

  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    setBackgroundImage
    setupGame
    createPlayerViews
    setupSubviews
  end

  def setBackgroundImage
    view.image = UIImage.imageNamed('field.png')
  end

  def setupGame
    @game = MagicField::Game.new
    @player_one = MagicField::Player.new(name: 'Dayton')
    @player_two = MagicField::Player.new(name: 'Mikey')
    
    @game.addPlayer(@player_one)
    @game.addPlayer(@player_two)
  end

  def createPlayerViews
    @playerOneView = MagicField::PlayerView.new(@player_one)
    @playerTwoView = MagicField::PlayerView.new(@player_two)
  end

  def setupSubviews
    view.addSubview(@playerOneView.view)
    view.addSubview(@playerTwoView.view)

    view.userInteractionEnabled = true
  end

end
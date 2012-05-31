class BattlefieldViewController < UIViewController

  attr_accessor :game

  def viewDidLoad
    super
    displayBackgroundImage
  end

  def displayBackgroundImage
    @backgroundImage = UIImageView.alloc.initWithImage UIImage.imageNamed('field.png')
    view.addSubview @backgroundImage
  end

  def start(p1, p2)
    @game = MagicField::Game.new(p1, p2)

    @p1View = PlayerView.new @game.p1
    @p2View = PlayerView.new @game.p2

    view.addSubview @p1View.view
    view.addSubview @p2View.view
  end


end
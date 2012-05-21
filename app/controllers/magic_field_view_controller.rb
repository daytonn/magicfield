class MagicFieldViewController < UIViewController

  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    game = MagicField::Game.new
    player_one = MagicField::Player.new(name: 'Dayton')
    player_two = MagicField::Player.new(name: 'Mikey')
    
    game.addPlayer(player_one)
    game.addPlayer(player_two)

    playerOneView = MagicField::PlayerView.new(player_one)
    playerTwoView = MagicField::PlayerView.new(player_two)

    view.image = UIImage.imageNamed('field.png')
    view.addSubview(playerOneView.view)
    view.addSubview(playerTwoView.view)

    view.userInteractionEnabled = true
  end

end
class StartViewController < UIViewController

  def viewDidLoad
    self.title = "Magic Field"
    view.userInteractionEnabled = true
    displayBackgroundImage
    displayStartScreenWindow
    displayWelcomeMessage
    displayPlayerInputs
    createStartButton
  end

  private

    def displayBackgroundImage
      @backgroundImage = UIImageView.alloc.initWithImage UIImage.imageNamed('field.png')
      view.addSubview @backgroundImage
    end

    def displayStartScreenWindow
      decorative_box = UIImage.imageNamed('decorative-box.png')
      @startScreenWindow = UIImageView.alloc.initWithImage(decorative_box)
      @startScreenWindow.frame = [[2, 226], decorative_box.size]

      view.addSubview @startScreenWindow
    end

    def displayWelcomeMessage
      @welcome_message = createLabel("Welcome To Magic Field", {
        offset: [190, 345],
        fontSize: 40,
        font: "Booter - Five Zero",
        color: UIColor.whiteColor,
        shadow: true
      })

      view.addSubview @welcome_message
    end

    def displayPlayerInputs
      @p1_name = createPlayerInput({
        placeholder: "Player One",
        offset: [189, 427],
      })

      @p2_name = createPlayerInput({
        placeholder: "Player Two",
        offset: [189, 517],
      })

      view.addSubview @p1_name
      view.addSubview @p2_name
    end

    def createStartButton
      @startButton = UIButton.buttonWithType UIButtonTypeRoundedRect
      @startButton.frame = [[460, 600], [100, 37]]
      @startButton.setTitle("Start", forState:UIControlStateNormal)
      @startButton.addTarget(self, action:"startGame", forControlEvents:UIControlEventTouchUpInside)
      view.addSubview @startButton
    end

    def startGame
      if thereAreTwoPlayers?
        @battlefieldView = BattlefieldViewController.alloc.init
        @battlefieldView.start(@p1_name.text, @p2_name.text)
        self.navigationController.pushViewController(@battlefieldView, animated:true)
      else
        alert "You need two players to play"
      end
    end

    def textFieldShouldReturn(textField)
      textField.resignFirstResponder
      true
    end

    def textFieldShouldEndEditing(textField)
      textField.resignFirstResponder
      true
    end

    def createPlayerInput(options)
      defaults = {
        dimensions: [390, 45],
        font: UIFont.systemFontOfSize(30),
        delegate: self
      }
      settings = defaults.merge! options
      textField = createTextField(settings)
    end

    def thereAreTwoPlayers?
      (@p1_name && @p2_name) && !(@p1_name.text.empty? && @p2_name.text.empty?)
    end

end
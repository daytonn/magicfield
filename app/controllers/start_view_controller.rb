class StartViewController < UIViewController

  def viewDidLoad
    self.title = "Magic Field"
    view.userInteractionEnabled = true
    drawBackgroundImage
    drawStartScreenWindow
    drawWelcomeMessage
    drawPlayerInputs
    drawPlayerOneManaButtons
    drawPlayerTwoManaButtons
    createStartButton
  end

  private

    def drawBackgroundImage
      @backgroundImage = UIImageView.alloc.initWithImage UIImage.imageNamed('field.png')
      view.addSubview @backgroundImage
    end

    def drawStartScreenWindow
      decorative_box = UIImage.imageNamed('decorative-box.png')
      @startScreenWindow = UIImageView.alloc.initWithImage(decorative_box)
      @startScreenWindow.frame = [[2, 226], decorative_box.size]

      view.addSubview @startScreenWindow
    end

    def drawWelcomeMessage
      @welcome_message = createLabel("Welcome To Magic Field", {
        offset: [190, 345],
        fontSize: 40,
        font: "Booter - Five Zero",
        color: UIColor.whiteColor,
        shadow: true
      })

      view.addSubview @welcome_message
    end

    def drawPlayerInputs
      @p1Name = createPlayerInput({
        placeholder: "Player One",
        offset: [189, 427],
      })

      @p2Name = createPlayerInput({
        placeholder: "Player Two",
        offset: [189, 517],
      })

      # Dev placeholders
      @p1Name.text = "Dayton"
      @p2Name.text = "Mikey"

      view.addSubview @p1Name
      view.addSubview @p2Name
    end

    def drawPlayerOneManaButtons
      redManaButton = MagicField::ManaButton.new "red"
      view.addSubview redManaButton.button
    end

    def drawPlayerTwoManaButtons
      
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
        @p1Name.resignFirstResponder
        @p2Name.resignFirstResponder
        @battlefieldView = BattlefieldViewController.alloc.init
        @battlefieldView.start(@p1Name.text, @p2Name.text)
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
      (@p1Name && @p2Name) && !(@p2Name.text.empty? && @p2Name.text.empty?)
    end

end
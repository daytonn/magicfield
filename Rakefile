$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap'

Motion::Project::App.setup do |app|
  root = './app'
  # Use `rake config' to see complete project settings.
  app.name = 'Magic Field'
  app.identifier = 'com.magicbeans.magicfield'
  app.device_family = :ipad
  app.icons = ['icon-72.png', 'icon-72@2x.png']
  app.fonts = ["BOOTERFZ.ttf", "MagicSchoolOne.ttf"]
  app.files << Dir.glob(File.join('vendor/BubbleWrap/lib/**/*.rb'))
  app.files << [
    "#{root}/models/game_model.rb",
    "#{root}/models/player_model.rb",
    "#{root}/views/player_view.rb",
    "#{root}/views/manna_button.rb",
    "#{root}/controllers/battlefield_view_controller.rb",
    "#{root}/controllers/start_view_controller.rb",
    "#{root}/app_delegate.rb"
  ]
end
def alert(message, title = '')
  alert = UIAlertView.alloc.init
  alert.title = title
  alert.message = message
  alert.addButtonWithTitle('OK')
  alert.show
end

def createLabel(text, options = {})
  label = UILabel.new
  defaults = {
    offset: [0, 0],
    dimensions: [0, 0],
    background: UIColor.clearColor,
    font: "Helvetica",
    fontSize: 12,
    color: UIColor.blackColor,
    align: UITextAlignmentLeft,
    shadow: false
  }
  settings = defaults.merge options

  label.frame = [settings[:offset], settings[:dimensions]]
  label.setBackgroundColor(settings[:background]);
  label.font = UIFont.fontWithName(settings[:font], size: settings[:fontSize])
  label.text = text
  label.textColor = settings[:color]
  label.textAlignment = settings[:align]
  label.shadowColor = UIColor.blackColor if settings[:shadow]
  label.sizeToFit

  label
end

def createTextField(options = {})
  defaults = {
    offset: [0.0, 30.0],
    dimensions: [220.0, 30.0],
    borderStyle: UITextBorderStyleRoundedRect,
    alignment: UITextAlignmentLeft,
    placeholder: "Enter text...",
    delegate: self,
    font: UIFont.systemFontOfSize(14)
  }

  settings = defaults.merge options

  textField = UITextField.alloc.initWithFrame([ settings[:offset], settings[:dimensions] ])
  textField.borderStyle = settings[:borderStyle]
  textField.textAlignment = settings[:alignment]
  textField.placeholder = settings[:placeholder]
  textField.delegate = settings[:delegate]
  textField.clearsOnBeginEditing = true
  textField.font = settings[:font]
  textField
end

def log(message)
  NSLog message
end
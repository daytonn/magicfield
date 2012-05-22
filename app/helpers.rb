def alert(message, title = '')
  alert = UIAlertView.alloc.init
  alert.title = title
  alert.message = message
  alert.addButtonWithTitle('OK')
  alert.show
end
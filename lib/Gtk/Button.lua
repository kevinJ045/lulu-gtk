
local {
  @default_to("")
  #label,
  
} ->
  @GtkWidgetNative('gtk_button_new')
  @GtkWidgetWithOptions({
    label = -1,
    icon_name = -1,
    child = -1
  }, 'gtk_button', "GtkButton*")
  Button:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_button_set_child',
    cast = 'GtkButton*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Button:set_child(child)
    print(child)
    self.child = child
  end

end

return Button

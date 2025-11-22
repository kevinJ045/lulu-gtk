
local {
  @default_to("")
  #label,
} ->
  @GtkWidgetNative('gtk_button_new')
  @GtkWidgetWithOptions({
    label = -1,
    icon_name = -1
  }, 'gtk_button', "GtkButton*")
  @GtkWidgetHandleChild('set_child')
  Button:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_button_set_child',
    cast = 'GtkButton*',
    arguments = {true},
  })
  @GtkWidgetChildHandler(1)
  @GtkWidgetReturnSelf()
  function Button:set_child(child) end

end

return Button

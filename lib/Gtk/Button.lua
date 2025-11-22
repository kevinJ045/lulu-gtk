
local {
  @default_to("")
  #label,
} ->
  @GtkWidgetNative('gtk_button_new')
  @GtkWidgetWithOptions({
    label = -1,
    icon_name = -1
  }, 'gtk_button', "GtkButton*")
  Button:GtkWidget
do

  function Button:init(o)
    if type(o) == "table" and o.child then
      self:set_child(o.child)
    end
  end

  @GtkWidgetOperation({
    operation = 'gtk_button_set_child',
    cast = 'GtkButton*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Button:set_child(child)
    self.child = child
  end

end

return Button


local {
  @default_to(nil)
  #label
} ->
  @GtkWidgetNative('gtk_frame_new')
  @GtkWidgetWithOptions({
    label = 1
  }, 'gtk_frame', "GtkFrame*")
  @GtkWidgetHandleChild('set_child')
  Frame:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_frame_set_child',
    cast = 'GtkFrame*',
    arguments = {true},
  })
  @GtkWidgetChildHandler(1)
  @GtkWidgetReturnSelf()
  function Frame:set_child(child) end

end

return Frame

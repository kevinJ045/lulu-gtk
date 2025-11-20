local {
  Vertical,
  Horizontal
} -< @enum_indexed(0) Orientation

local {
  @default_to('vertical')
  #orientation,
  @default_to(5)
  #spacing
  @default_to(Vec())
  #children
} ->
  @GtkWidgetNative('gtk_box_new')
  @GtkWidgetWithOptions('orientation', 'spacing')
  @GtkWidgetOptionOverride(
    'orientation',
    Orientation::index
  )
  @GtkWidgetHandleChildren('append')
  Box
do

  @GtkWidgetOperation({
    operation = 'gtk_box_append',
    cast = 'GtkBox*',
    arguments = {true},
  })
  @GtkWidgetChildrenHandler(1)
  @GtkWidgetReturnSelf()
  function Box:append(child) end

end

return Box



local {
  @enum_index(1)
  Vertical,
  @enum_index(0)
  Horizontal
} -< Orientation

local {
  @default_to('vertical')
  #orientation,
  @default_to(5)
  #spacing
  @default_to(Vec())
  #children
} ->
  @GtkWidgetNative('gtk_box_new')
  @GtkWidgetWithOptions({
    orientation = gtk_option_mapper {
      cast = "GtkBox*",
      mapper = Orientation::index,
      at = 1
    },
    spacing = 2
  }, 'gtk_box')
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

  @GtkWidgetOperation({
    operation = 'gtk_box_prepend',
    cast = 'GtkBox*',
    arguments = {true},
  })
  @GtkWidgetChildrenHandler(1, true)
  @GtkWidgetReturnSelf()
  function Box:prepend(child) end

  @GtkWidgetOperation({
    operation = 'gtk_box_remove',
    cast = 'GtkBox*',
    arguments = {true},
  })
  @GtkWidgetChildrenRemover(1)
  @GtkWidgetReturnSelf()
  function Box:remove(child) end

end

return Box



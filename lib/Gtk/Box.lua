local {
  @enum_index(0) Horizontal,
  @enum_index(1) Vertical
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
      cast = "GtkOrientable*",
      mapper = Orientation::index,
      at = 1,
      operation = "gtk_orientable_set_orientation"
    },
    spacing = 2
  }, 'gtk_box', 'GtkBox*')
  @GtkWidgetHandleChildren('append')
  Box:GtkWidget
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



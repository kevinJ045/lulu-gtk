
local {} ->
  @GtkWidgetNative('gtk_stack_new')
  @GtkWidgetWithOptions({
    transition_type = gtk_option_mapper {
      mapper = GtkStackTransition::index,
      at = -1,
    },
    transition_duration = -1
  }, 'gtk_stack', "GtkStack*")
  @GtkWidgetHandleChildren('add_titled', function(child)
    return child, child.name, child.title
  end)
  Stack:GtkWidget
do

  @GtkWidgetOperation({
    operation = 'gtk_stack_add_titled',
    cast = 'GtkStack*',
    arguments = {true, false, false},
  })
  @GtkWidgetChildrenHandler(1)
  @GtkWidgetReturnSelf()
  function Stack:add_titled(widget, name, title) end

end

return Stack


local {} ->
  @GtkWidgetNative('gtk_stack_sidebar_new')
  @GtkWidgetWithOptions({
    stack = -1
  }, 'gtk_stack_sidebar', "GtkStackSidebar*")
  StackSidebar:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_stack_sidebar_set_stack',
    cast = 'GtkStackSidebar*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function StackSidebar:set_stack(stack)
    self.stack = stack
  end
end

return StackSidebar

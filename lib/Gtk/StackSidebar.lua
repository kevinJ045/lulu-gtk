
local {} ->
  @GtkWidgetNative('gtk_stack_sidebar_new')
  @GtkWidgetWithOptions({
    stack = gtk_option_mapper {
      at = -1,
      arguments = {"GtkStack*"}
    }
  }, 'gtk_stack_sidebar', "GtkStackSidebar*")
  StackSidebar:GtkWidget
do end

return StackSidebar

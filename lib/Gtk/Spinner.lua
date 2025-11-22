
local {} ->
  @GtkWidgetNative('gtk_spinner_new')
  @GtkWidgetWithOptions({
    spinning = -1
  }, 'gtk_spinner', "GtkSpinner*")
  Spinner:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_spinner_start',
    cast = 'GtkSpinner*',
    arguments = {},
  })
  @GtkWidgetReturnSelf()
  function Spinner:start()
  end

  @GtkWidgetOperation({
    operation = 'gtk_spinner_stop',
    cast = 'GtkSpinner*',
    arguments = {},
  })
  @GtkWidgetReturnSelf()
  function Spinner:stop()
  end
end

return Spinner

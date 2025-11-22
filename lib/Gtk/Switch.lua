
local {} ->
  @GtkWidgetNative('gtk_switch_new')
  @GtkWidgetWithOptions({
    active = -1,
    state = -1
  }, 'gtk_switch', "GtkSwitch*")
  Switch:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_switch_get_active',
    cast = 'GtkSwitch*',
    arguments = {},
  })
  function Switch:get_active()
  end

  @GtkWidgetOperation({
    operation = 'gtk_switch_set_active',
    cast = 'GtkSwitch*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Switch:set_active(b)
  end
end

return Switch
